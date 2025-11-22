<?php
session_start();

// Retrieve the email and password from the form
$email = $_POST['email'];
$password = $_POST['password'];

// Establish a connection to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "restaurant";

// Enable error reporting
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve the email and password from the form
$email = $_POST['email'];
$password = $_POST['password'];

// Check if the email and password match an admin or user
// Prepare the SQL query for users table
$sql_users = "SELECT * FROM users WHERE email = ? AND password = ?";
$stmt_users = $conn->prepare($sql_users);
$stmt_users->bind_param("ss", $email, $password);
$stmt_users->execute();
$result_users = $stmt_users->get_result();

// Prepare the SQL query for staff table
$sql_staff = "SELECT * FROM staff WHERE email = ? AND password = ?";
$stmt_staff = $conn->prepare($sql_staff);
$stmt_staff->bind_param("ss", $email, $password);
$stmt_staff->execute();
$result_staff = $stmt_staff->get_result();

try {

    // Cek apakah ditemukan data staff
    if ($result_staff->num_rows > 0) {

        $staff = $result_staff->fetch_assoc();

        // Role yang diizinkan
        $allowedRoles = ['superadmin', 'admin', 'waiter', 'delivery boy'];

        if (in_array($staff['role'], $allowedRoles)) {

            // Simpan session
            $_SESSION['email'] = $email;
            $_SESSION['adminloggedin'] = true;
            $_SESSION['role'] = $staff['role'];

            echo '<script>alert("Admin is logged in!"); window.location.href="Admin/index.php";</script>';
            exit();

        } else {

            // Role tidak diizinkan
            header('Location: login.php?error=not_authorized');
            exit();
        }

    } else {

        // Tidak ditemukan user dengan email tsb
        header('Location: login.php?error=invalid_credentials');
        exit();
    }

} catch (Exception $e) {

    // Jika terjadi error sistem
    header('Location: login.php?error=server_error');
    exit();
}

// Tutup koneksi
$conn->close();