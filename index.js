const express = require("express");
const app = express();

// ✅ penting untuk Railway
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send("Server jalan!");
});

// ✅ pakai PORT dari Railway
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
``
