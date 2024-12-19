# API Good Night

API Good Night is a Ruby on Rails application designed for managing user sleep records and social interactions like following/unfollowing other users. This project serves as a testing ground for an interview scenario and is designed to demonstrate clean code practices and functional API design.

---

## Features

- **Sleep Records**
  - Clock-in and clock-out functionality for tracking sleep sessions.
  - View sleep records of users you follow.

- **Social Interactions**
  - Follow and unfollow other users.

- **Health Check**
  - A health check endpoint to verify API availability.

- **API Documentation**
  - Swagger integration for interactive API documentation using `rswag`.

---

## Requirements

- Ruby 3.2+
- Rails 7+
- Sqlite

---

## Setup Instructions

### Clone the Repository

```bash
git clone https://github.com/your-username/api-good-night.git
cd api-good-night
```

### Install Dependencies

```bash
bundle install
```

### Set Up the Database

```bash
rails db:setup
```
This will create, migrate, and seed the database.

### Run the Server

```bash
rails server
```
The application will be accessible at `http://localhost:3000`.

### Health Check

Visit `http://localhost:3000/up` to ensure the application is running.

---

## API Endpoints

### Base URL

```
http://localhost:3000/api/v1
```

### User Routes

#### Sleep Records
- **Clock In**: `POST /users/:id/sleep_records/clock_in`
- **Clock Out**: `POST /users/:id/sleep_records/:sleep_record_id/clock_out`
- **Following Records**: `GET /users/:id/sleep_records/following`

#### Social Interactions
- **Follow a User**: `POST /users/:id/follow/:target_id`
- **Unfollow a User**: `DELETE /users/:id/unfollow/:target_id`

### API Documentation

Swagger documentation is available at:
```
http://localhost:3000/api-docs
```

---

## Testing

### RSpec

Run the test suite using:
```bash
bundle exec rspec
```

### RuboCop

Lint the codebase using:
```bash
bundle exec rubocop
```

---

## Seeding Data

To populate the database with sample data, run:
```bash
rails db:seed
```

---

## Code Quality and Guidelines

This project adheres to clean code principles, leveraging:
- **RSpec** for testing.
- **RuboCop** for linting and enforcing Ruby style guidelines.

---

## Contributing

Feel free to fork the repository and submit pull requests to improve the project.

---

## License

This project is open source and available under the [MIT License](LICENSE).

