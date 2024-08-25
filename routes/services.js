const Joi = require("joi");
const bcrypt = require("bcryptjs");
const express = require("express");
const router = express.Router();
const db = require("../startup/db")();
const dbTable = "services";
const auth = require("../middleware/auth");

// Show events
router.get("/", [auth], async (req, res) => {
  db.query(
    `SELECT * FROM ${dbTable} ORDER BY id DESC`,
    function (err, results) {
      console.log(err);
      res.send(results);
    }
  );
});
// Show users
router.get("/pagination/", [auth], async (req, res) => {
  console.log(req.query);
  let { start, end } = req.query;
  db.query(
    `SELECT S.id,S.slug,S.title,S.imageCover,S.content,S.created,S.status,(SELECT COUNT(*) FROM ${dbTable}) as serviceCount
FROM 
${dbTable} S ORDER BY S.id DESC LIMIT ${start},${end}`,
    function (err, results) {
      console.log(err);
      res.send(results);
    }
  );
});
// Show event by id
router.get("/:id", [auth], async (req, res) => {
  db.query(
    `SELECT * FROM ${dbTable} WHERE id = ?`,
    [req.params.id],
    function (err, results) {
      if (results.length == 0) {
        res
          .status(404)
          .send("The event with the given ID could not be  Found.");
      } else {
        res.send(results);
      }
    }
  );
});

// Create event
router.post("/", [auth], async (req, res) => {
  const { error } = validateService(req.body);
  const currentDateTime = new Date();
  if (error) return res.status(400).send(error.details[0].message);
  db.query(
    `SELECT * FROM ${dbTable} where title = ?`,
    [req.body.title],
    function (err, results) {
      if (results.length > 0) {
        return res.status(400).send("This  exist already");
      } else {
        db.query(
          `INSERT INTO ${dbTable} (title,slug,imageCover,content) VALUES(?,?,?,?)`,
          [
            req.body.title,
            req.body.slug,
            req.body.imageCover,
            req.body.content,
          ],
          function (err, results) {
            if (err) {
              console.log(err);
              res.status(500).send("could not be Created");
            } else {
              res.send("Created Successfully");
            }
          }
        );
      }
    }
  );
});

// Update event by id
router.put("/:id", [auth], async (req, res) => {
  db.query(
    `SELECT * FROM ${dbTable} where id = ?`,
    [req.params.id],
    function (err, results) {
      if (results.length > 0) {
        db.query(
          `UPDATE ${dbTable} SET title = ?,slug=?, imageCover= ?,content= ?  WHERE id = ? `,
          [
            req.body.title,
            req.body.slug,
            req.body.imageCover,
            req.body.content,
            req.params.id,
          ],
          function (err, results) {
            if (err) {
              console.log(err);
              res.status(500).send("could not be Updated");
            } else {
              res.send("Updated Successfully");
            }
          }
        );
      } else {
        return res
          .status(404)
          .send("The event with the given ID could not be  Found.");
      }
    }
  );
});

// Delete user by id
router.delete("/:id", [auth], async (req, res) => {
  db.query(
    `SELECT * FROM ${dbTable} where id = ?`,
    [req.params.id],
    function (err, results) {
      if (results.length > 0) {
        db.query(
          `DELETE FROM ${dbTable}  WHERE id = ? `,
          [req.params.id],
          function (err, results) {
            if (err) {
              res.status(500).send("could not be Deleted");
            } else {
              res.send("Deleted Successfully");
            }
          }
        );
      } else {
        return res
          .status(404)
          .send("The Course with the given ID could not be  Found.");
      }
    }
  );
});

function validateService(course) {
  const schema = {
    title: Joi.string().min(2).max(250).required(),
    imageCover: Joi.string().min(2).max(500).required(),
    slug: Joi.string().min(2).max(500).required(),
    content: Joi.string().min(20).required(),
  };
  return Joi.validate(course, schema);
}

module.exports = router;
