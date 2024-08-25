const Joi = require("joi");
const bcrypt = require("bcryptjs");
const express = require("express");
const router = express.Router();
const db = require("../startup/db")();
const dbTable = "clients";
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
    `SELECT C.id,C.clientName,C.clientLogo,C.created,C.status,(SELECT COUNT(*) FROM ${dbTable}) as clientsCount
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
          .send("The Client with the given ID could not be  Found.");
      } else {
        res.send(results);
      }
    }
  );
});

// Create event
router.post("/", [auth], async (req, res) => {
  const { error } = validateClients(req.body);
  const currentDateTime = new Date();
  if (error) return res.status(400).send(error.details[0].message);
  db.query(
    `SELECT * FROM ${dbTable} where clientName = ? and clientLogo = ?`,
    [req.body.clientName, req.body.clientLogo],
    function (err, results) {
      if (results.length > 0) {
        return res.status(400).send("This Client exist already");
      } else {
        db.query(
          `INSERT INTO ${dbTable} (clientName,clientLogo) VALUES(?,?)`,
          [req.body.clientName, req.body.clientLogo],
          function (err, results) {
            if (err) {
              console.log(err);
              res.status(500).send(" could not be Created");
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
          `UPDATE ${dbTable} SET clientName = ?,clientLogo= ?  WHERE id = ? `,
          [req.body.clientName, req.body.clientLogo, req.params.id],
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
              res.status(500).send("could not be Deleted");
            } else {
              res.send("Deleted Successfully");
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

function validateClients(client) {
  const schema = {
    clientName: Joi.string().min(2).max(250).required(),
    clientLogo: Joi.string().min(2).max(500).required(),
  };
  return Joi.validate(client, schema);
}

module.exports = router;
