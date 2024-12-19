## Overview
This document highlights key parts of the codebase with clear explanations to ensure easy understanding.

---

## Controllers

### **FollowingsController**
- **`create` Method**:
  - Handles following a user.
  - Uses the `Followings::FollowService` to encapsulate the logic.
  - Catches errors like self-following or already following a user and returns appropriate error messages.

- **`destroy` Method**:
  - Handles unfollowing a user.
  - Uses the `Followings::UnfollowService`.
  - Validates the existence of a following relationship before deletion.

### **SleepRecordsController**
- **`clock_in` Method**:
  - Allows a user to start a new sleep record.
  - Prevents starting multiple sleep records simultaneously using validation in the service.

- **`clock_out` Method**:
  - Completes an in-progress sleep record.
  - Validates record existence and ensures it hasn’t been completed already.

- **`following_records` Method**:
  - Fetches sleep records of followed users from the past week.
  - Supports pagination using the `Pagy` gem for better performance and scalability.

---

## Models

### **User**
- **Associations**:
  - Tracks both followers and followed users using `has_many` relationships with the `Following` model.
  - Provides helper methods for checking follow status (`follow`, `unfollow`, `following?`).

- **Validations**:
  - Ensures the `name` is present to maintain meaningful records.

### **Following**
- **Associations**:
  - Defines `follower` and `followed` as separate `User` objects.

- **Custom Validation**:
  - Prevents users from following themselves using the `not_self_following` method.

### **SleepRecord**
- **Scopes**:
  - `last_week`: Fetches records from the past week.
  - `ordered_by_duration`: Retrieves records sorted by sleep duration.
  - `in_progress`: Identifies records without a `clock_out_at`.

- **Callbacks**:
  - Calculates the `duration_minutes` automatically when a record is completed.

---

## Services

### **Followings::FollowService**
- Handles the logic for following a user.
- Validates:
  - Users exist.
  - Self-following is disallowed.
  - Duplicate follow entries are avoided.

### **Followings::UnfollowService**
- Manages unfollowing logic.
- Ensures a following relationship exists before attempting to delete it.

### **SleepRecords::ClockInService**
- Prevents users from starting a new sleep record if one is already in progress.
- Automatically sets the `clock_in_at` time to the current timestamp.

### **SleepRecords::ClockOutService**
- Validates and updates an in-progress sleep record to add a `clock_out_at` time.
- Automatically calculates the total sleep duration.

### **SleepRecords::FollowingRecordsService**
- Fetches sleep records of followed users within the last week.
- Implements caching to store followed user IDs for five minutes.
- Supports pagination for efficient data retrieval.

---

## Shared Features

### **BaseService** (Shared by `SleepRecords` Services)
- Provides a helper method `validate_user!` to ensure the user exists.
- Raises a `NotFoundError` for missing users, maintaining consistency in error handling.

---

## Error Handling
- Uses custom error classes (`ValidationError`, `NotFoundError`) to standardize error responses.
- Ensures controllers handle exceptions gracefully and return meaningful error messages to the client.

---

## Scalable Design Principles
1. **Service Objects**: Encapsulate business logic for clean, reusable code.
2. **Custom Exceptions**: Provide consistent and clear error responses.
3. **Scopes**: Simplify model queries and improve readability.
4. **Caching**: Optimizes performance for frequently accessed data (e.g., followed user IDs).
5. **Pagination**: Ensures efficient data retrieval for large datasets.

---

This document should serve as a quick reference guide for understanding the codebase's key components and their purposes.

