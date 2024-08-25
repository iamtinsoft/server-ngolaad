const Joi = require("joi");
const bcrypt = require("bcryptjs");
const express = require("express");
const router = express.Router();
const db = require("../startup/db")();
const dbTable = "site_events";
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
    `SELECT E.id,E.eventName,E.eventDate,E.content,E.created,E.status,(SELECT COUNT(*) FROM ${dbTable}) as eventsCount
FROM 
${dbTable} E ORDER BY E.id DESC LIMIT ${start},${end}`,
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
  const { error } = validateEvents(req.body);
  const currentDateTime = new Date();
  if (error) return res.status(400).send(error.details[0].message);
  db.query(
    `SELECT * FROM ${dbTable} where eventName = ? and eventDate = ?`,
    [req.body.eventName, req.body.eventDate],
    function (err, results) {
      if (results.length > 0) {
        return res.status(400).send("This event exist already");
      } else {
        db.query(
          `INSERT INTO ${dbTable} (eventName,eventDate,content) VALUES(?,?,?)`,
          [req.body.eventName, req.body.eventDate, req.body.content],
          function (err, results) {
            if (err) {
              console.log(err);
              res.status(500).send("Event could not be Created");
            } else {
              res.send("Event Created Successfully");
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
          `UPDATE ${dbTable} SET eventName = ?,eventDate= ?,content= ? WHERE id = ? `,
          [
            req.body.eventName,
            req.body.eventDate,
            req.body.content,
            req.params.id,
          ],
          function (err, results) {
            if (err) {
              console.log(err);
              res.status(500).send("Event could not be Updated");
            } else {
              res.send("Event Updated Successfully");
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
              res.status(500).send("Event could not be Deleted");
            } else {
              res.send("Event Deleted Successfully");
            }
          }
        );
      } else {
        return res
          .status(404)
          .send("The Event with the given ID could not be  Found.");
      }
    }
  );
});

function validateEvents(event) {
  const schema = {
    eventName: Joi.string().min(2).max(250).required(),
    eventDate: Joi.string().min(2).max(50).required(),
    content: Joi.string().min(2).max(500).required(),
  };
  return Joi.validate(event, schema);
}

module.exports = router;
