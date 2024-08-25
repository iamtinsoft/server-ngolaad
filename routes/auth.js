const Joi = require("joi");
const config = require("config");
const bcrypt = require("bcryptjs");
const express = require("express");
const router = express.Router();
const dbTable = "admins";
const db = require("../startup/db")();
const { generateAuthToken } = require("../helpers/token");
const { sendPasswordResetEmail, sendOtpEmail } = require("./../helpers/email");
const auth = require("../middleware/auth");
// const resetUrl = config.get("client_url") + "/auth/reset-password";

// Authorize users
router.post("/", [auth], async (req, res) => {
  const { error } = validateUser(req.body);
  if (error) return res.status(400).send(error.details[0].message);
  db.query(
    `SELECT * FROM ${dbTable} WHERE email =?`,
    [req.body.email],
    async function (err, results) {
      //let fullName = "";
      if (results.length == 1) {
        const user = results[0];
        //fullName = user.firstName + " " + user.lastName;
        const validPassword = await bcrypt.compare(
          req.body.password,
          user.password
        );
        if (!validPassword)
          return res.status(400).send("Invalid email or password.");
        const token = generateAuthToken(user);
        //sendOtpEmail(req.body.email, "OTP", req.body.code, fullName);
        res.send(token);
      } else {
        return res.status(400).send("Invalid email or password.");
      }
    }
  );
});

// Deactivate User Account
router.put("/account/:id/:status", async (req, res) => {
  console.log(req.params.id);
  db.query(
    `SELECT * FROM ${dbTable} where id = ?`,
    [req.params.id],
    function (err, results) {
      if (results.length > 0) {
        db.query(
          `UPDATE ${dbTable} SET status =? WHERE id = ? `,
          [req.params.status, req.params.id],
          function (err, results) {
            if (err) {
              res.status(500).send("Account could not be Updated");
            } else {
              res.send("Account Updated Successfully");
            }
          }
        );
      } else {
        return res
          .status(400)
          .send("The Admin with the given ID could not be  Found.");
      }
    }
  );
});

// Deactivate User Account
// router.put("/setGeolocation", async (req, res) => {
//   db.query(
//     `SELECT * FROM ${dbTable} where userId = ?`,
//     [req.body.userId],
//     function (err, results) {
//       if (results.length > 0) {
//         db.query(
//           `UPDATE ${dbTable} SET latitude =?,longitude =? WHERE userId = ? `,
//           [req.body.latitude, req.body.longitude, req.body.userId],
//           function (err, results) {
//             if (err) {
//               res.status(500).send("User Account could not be Updated");
//             } else {
//               res.send("User Account Updated Successfully");
//             }
//           }
//         );
//       } else {
//         return res
//           .status(400)
//           .send("The User with the given ID could not be  Found.");
//       }
//     }
//   );
// });

function validateUser(user) {
  const schema = {
    email: Joi.string().min(2).max(255).required(),
    password: Joi.string().min(2).max(50).required(),
  };
  return Joi.validate(user, schema);
}

module.exports = router;
