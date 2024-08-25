const bcrypt = require("bcryptjs");
const express = require("express");
const router = express.Router();
const { sendContactEmail, sendBookingEmail } = require("./../helpers/email");

// Create news
router.post("/sendContactEmail", async (req, res) => {
  await sendContactEmail(
    "",
    "Contact Email",
    req.body.message,
    req.body.fullName,
    req.body.phone,
    req.body.email,
    req.body.company
  );
  res.send("Mail Sent Successfully");
});

router.post("/sendBookingEmail", async (req, res) => {
  await sendBookingEmail(
    req.body.email,
    "Appointment Email",
    req.body.message,
    req.body.name,
    req.body.phone,
    req.body.email,
    req.body.appointmentDate,
    req.body.appointmentTime
  );
  res.send("Mail Sent Successfully");
});

module.exports = router;
