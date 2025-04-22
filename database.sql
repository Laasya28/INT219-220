-- Create users table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    reset_token VARCHAR(64) NULL,
    reset_expiry DATETIME NULL,
    profile_image VARCHAR(255) NULL,
    bio TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL
) ENGINE=InnoDB;

-- Create contact_submissions table
CREATE TABLE contact_submissions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NULL,
    subject VARCHAR(200) NOT NULL,
    message TEXT NOT NULL,
    status ENUM('new', 'in_progress', 'resolved') DEFAULT 'new',
    admin_notes TEXT NULL,
    submission_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Create user_preferences table
CREATE TABLE user_preferences (
    user_id INT PRIMARY KEY,
    theme VARCHAR(20) DEFAULT 'light',
    email_notifications BOOLEAN DEFAULT TRUE,
    newsletter_subscription BOOLEAN DEFAULT TRUE,
    language VARCHAR(10) DEFAULT 'en',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Insert sample data
INSERT INTO users (username, email, password, bio) VALUES 
('john_doe', 'john@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Travel enthusiast'),
('jane_smith', 'jane@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Adventure seeker');

-- Insert sample contact submissions
INSERT INTO contact_submissions (name, email, subject, message) VALUES 
('Mike Johnson', 'mike@example.com', 'Tour Package Inquiry', 'I would like to know more about your Europe tour packages.'),
('Sarah Wilson', 'sarah@example.com', 'Booking Question', 'What is the cancellation policy for bookings?');

-- Insert sample user preferences
INSERT INTO user_preferences (user_id, theme, newsletter_subscription) VALUES 
(1, 'dark', TRUE),
(2, 'light', FALSE);
