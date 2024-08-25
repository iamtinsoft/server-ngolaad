const Joi = require("joi");
const config = require("config");
const bcrypt = require("bcryptjs");
const express = require("express");
const router = express.Router();
const db = require("../startup/db")();
const dbTable = "admins";
const appUrl = config.get("client_url") + "/auth/reset-password";
const { generateAuthToken } = require("../helpers/token");
const auth = require("../middleware/auth");
const { sendWelcomeEmail } = require("../helpers/email");

// Show All Users
router.get("/", [auth], async (req, res) => {
  db.query(
    `SELECT U.id,U.firstName,U.lastName,U.email,U.created,U.status,(SELECT COUNT(*) FROM ${dbTable}) as usersCount
FROM 
${dbTable} U ORDER BY U.id`,
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
    `SELECT U.id,U.firstName,U.lastName,U.email,U.created,U.status,(SELECT COUNT(*) FROM ${dbTable}) as usersCount
FROM 
${dbTable} U ORDER BY U.id DESC LIMIT ${start},${end}`,
    function (err, results) {
      console.log(err);
      res.send(results);
    }
  );
});

// Show user by id
router.get("/:id", [auth], async (req, res) => {
  db.query(
    `SELECT * FROM ${dbTable} WHERE id = ?`,
    [req.params.id],
    function (err, results) {
      if (results.length == 0) {
        res.status(404).send("The user with the given ID could not be  Found.");
      } else {
        res.send(results);
      }
    }
  );
});

// Show user by status
router.get("/status/:id", [auth], async (req, res) => {
  db.query(
    `SELECT * FROM ${dbTable} WHERE status = ?`,
    [req.params.id],
    function (err, results) {
      if (results.length == 0) {
        res.status(404).send("The user with the given ID could not be  Found.");
      } else {
        res.send(results);
      }
    }
  );
});
// Create users
router.post("/", [auth], async (req, res) => {
  const { error } = validateUsers(req.body);
  const currentDateTime = new Date();
  const salt = await bcrypt.genSalt(10);
  let cryptedPassword = await bcrypt.hash("@Password123", salt);
  if (error) return res.status(400).send(error.details[0].message);
  db.query(
    `SELECT * FROM ${dbTable} where email = ?`,
    [req.body.email],
    function (err, results) {
      if (results.length > 0) {
        return res
          .status(400)
          .send(
            "THE EMAIL ADDRESS /USERNAME IS ALREADY IN USE, PLEASE TRY AGAIN."
          );
      } else {
        let fullName = req.body.firstName + " " + req.body.lastName;
        db.query(
          `INSERT INTO ${dbTable} (firstName,lastName,email,password,lastLogin) VALUES(?,?,?,?,?)`,
          [
            req.body.firstName,
            req.body.lastName,
            req.body.email,
            cryptedPassword,

            currentDateTime.toLocaleDateString(),
          ],
          function (err, results) {
            if (err) {
              console.log(err);
              res.status(500).send("could not be Created");
            } else {
              sendWelcomeEmail(
                req.body.email,
                "ACCOUNT CREATION",
                "Please note that your Account has been created successfully",
                fullName,
                "",
                "@Password123"
              );

              res.send("User Created Successfully");
            }
          }
        );
      }
    }
  );
});

// Update user by id
router.put("/profile/:id", [auth], async (req, res) => {
  db.query(
    `SELECT * FROM ${dbTable} where id = ?`,
    [req.params.id],
    function (err, results) {
      if (results.length > 0) {
        db.query(
          `UPDATE ${dbTable} SET firstName =? , lastName =? WHERE id = ? `,
          [req.body.firstName, req.body.lastName, req.params.id],
          function (err, results) {
            if (err) {
              console.log(err);
              res.status(500).send("could not be Updated");
            } else {
              // res.send("User Updated Successfully");
              db.query(
                `SELECT * FROM ${dbTable} where id =?`,
                [req.params.id],
                async function (err, results) {
                  if (results.length == 1) {
                    const user = results[0];
                    const token = generateAuthToken(user);
                    res.send(token);
                  } else {
                    return res.status(404).send("User Not Found.");
                  }
                }
              );
            }
          }
        );
      } else {
        return res
          .status(404)
          .send("The user with the given ID could not be  Found.");
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
              res.status(500).send("User could not be Deleted");
            } else {
              res.send("User Deleted Successfully");
            }
          }
        );
      } else {
        return res
          .status(404)
          .send("The User withe given ID could not be  Found.");
      }
    }
  );
});

function validateUsers(user) {
  const schema = {
    firstName: Joi.string().min(2).max(50).required(),
    lastName: Joi.string().min(2).max(50).required(),
    email: Joi.string().min(2).max(50).required(),
    //password: Joi.string().min(2).max(500).required(),
  };
  return Joi.validate(user, schema);
}

module.exports = router;
