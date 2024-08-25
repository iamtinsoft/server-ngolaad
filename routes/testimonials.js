const Joi = require("joi");
const bcrypt = require("bcryptjs");
const express = require("express");
const router = express.Router();
const db = require("../startup/db")();
const dbTable = "testimonials";
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
    `SELECT T.id,T.firstName,T.lastName,T.content,T.created,T.status,(SELECT COUNT(*) FROM ${dbTable}) as testimonialCount
FROM 
${dbTable} T ORDER BY T.id DESC LIMIT ${start},${end}`,
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
  const { error } = validateTestimonial(req.body);
  const currentDateTime = new Date();
  if (error) return res.status(400).send(error.details[0].message);
  db.query(
    `SELECT * FROM ${dbTable} where firstName = ? AND lastName = ?`,
    [req.body.firstName, req.body.lastName],
    function (err, results) {
      if (results.length > 0) {
        return res.status(400).send("This Content exist already");
      } else {
        db.query(
          `INSERT INTO ${dbTable} (firstName,lastName,content) VALUES(?,?,?)`,
          [req.body.firstName, req.body.lastName, req.body.content],
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
          `UPDATE ${dbTable} SET firstName = ?,lastName= ?,content= ?  WHERE id = ? `,
          [
            req.body.firstName,
            req.body.lastName,
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

function validateTestimonial(course) {
  const schema = {
    firstName: Joi.string().min(2).max(50).required(),
    lastName: Joi.string().min(2).max(50).required(),
    content: Joi.string().min(20).required(),
  };
  return Joi.validate(course, schema);
}

module.exports = router;
