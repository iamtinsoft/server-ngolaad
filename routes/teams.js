const Joi = require("joi");
const bcrypt = require("bcryptjs");
const express = require("express");
const router = express.Router();
const db = require("../startup/db")();
const dbTable = "teams";
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
    `SELECT S.id,S.name,S.avatarUrl,S.email,S.role,S.bio,S.created,S.status,(SELECT COUNT(*) FROM ${dbTable}) as teamsCount
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
  const { error } = validateTeams(req.body);
  const currentDateTime = new Date();
  if (error) return res.status(400).send(error.details[0].message);
  db.query(
    `SELECT * FROM ${dbTable} where email = ?`,
    [req.body.email],
    function (err, results) {
      if (results.length > 0) {
        return res.status(400).send("This  exist already");
      } else {
        db.query(
          `INSERT INTO ${dbTable} (name,avatarUrl,email,role,bio) VALUES(?,?,?,?,?)`,
          [
            req.body.name,
            req.body.avatarUrl,
            req.body.email,
            req.body.role,
            req.body.bio,
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
          `UPDATE ${dbTable} SET name = ?,avatarUrl = ?,email=?, role= ?,bio= ?  WHERE id = ? `,
          [
            req.body.name,
            req.body.avatarUrl,
            req.body.email,
            req.body.role,
            req.body.bio,
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

function validateTeams(teams) {
  const schema = {
    name: Joi.string().min(2).max(100).required(),
    avatarUrl: Joi.string().min(2).max(500).required(),
    email: Joi.string().min(2).max(255).required(),
    role: Joi.string().min(2).max(255).required(),
    bio: Joi.string().min(2).required(),
  };
  return Joi.validate(teams, schema);
}

module.exports = router;
