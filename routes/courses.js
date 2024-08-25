const Joi = require("joi");
const bcrypt = require("bcryptjs");
const express = require("express");
const router = express.Router();
const db = require("../startup/db")();
const dbTable = "courses";
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
    `SELECT C.id,C.courseName,C.courseCover,C.content,C.created,C.status,(SELECT COUNT(*) FROM ${dbTable}) as coursesCount
FROM 
${dbTable} C ORDER BY C.id DESC LIMIT ${start},${end}`,
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
  const { error } = validateCourse(req.body);
  const currentDateTime = new Date();
  if (error) return res.status(400).send(error.details[0].message);
  db.query(
    `SELECT * FROM ${dbTable} where courseName = ?`,
    [req.body.courseName],
    function (err, results) {
      if (results.length > 0) {
        return res.status(400).send("This Course exist already");
      } else {
        db.query(
          `INSERT INTO ${dbTable} (courseName,courseCover,content) VALUES(?,?,?)`,
          [req.body.courseName, req.body.courseCover, req.body.content],
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
          `UPDATE ${dbTable} SET courseName = ?,courseCover= ?,content= ?  WHERE id = ? `,
          [
            req.body.courseName,
            req.body.courseCover,
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

function validateCourse(course) {
  const schema = {
    courseName: Joi.string().min(2).max(250).required(),
    courseCover: Joi.string().min(2).max(500).required(),
    content: Joi.string().min(20).required(),
  };
  return Joi.validate(course, schema);
}

module.exports = router;
