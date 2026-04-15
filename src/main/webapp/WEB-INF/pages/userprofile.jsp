<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Profile Settings</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/userprofile.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

  <div class="page-wrapper">
  <!-- Sidebar -->
<jsp:include page="sidebar.jsp" />

    <!-- Main Content -->
    <main class="main-content">
      <div class="profile-card">

        <!-- Avatar Section -->
        <div class="avatar-section">
          <div class="avatar-wrapper">
            <img src="<%=request.getContextPath()%>/assets/krish.png" alt="Profile Photo" class="avatar-img"/>
            <button class="avatar-edit-btn" title="Change photo">
              <i class="fa-solid fa-camera"></i>
            </button>
          </div>
        </div>

        <!-- Form Section -->
        <div class="form-section">
          <div class="form-grid">

            <div class="form-group">
              <label class="form-label" for="firstName">First Name:</label>
              <input class="form-input" type="text" id="firstName" value="Krish" placeholder="First name" />
            </div>

            <div class="form-group">
              <label class="form-label" for="lastName">Last Name:</label>
              <input class="form-input" type="text" id="lastName" value="Shrestha" placeholder="Last name" />
            </div>

            <div class="form-group">
              <label class="form-label" for="email">Email:</label>
              <input class="form-input" type="email" id="email" value="sthakriz098@gmail.com" placeholder="Email address" />
            </div>

            <div class="form-group">
              <label class="form-label" for="phone">Phone Number:</label>
              <input class="form-input" type="tel" id="phone" value="9869750231" placeholder="Phone number" />
            </div>

          </div>

          <!-- Gender -->
          <div class="gender-group">
            <label class="form-label">Gender</label>
            <div class="radio-group">
              <label class="radio-label">
                <input type="radio" name="gender" value="male" checked />
                <span class="radio-custom"></span>
                <span class="radio-text">Male</span>
              </label>
              <label class="radio-label">
                <input type="radio" name="gender" value="female" />
                <span class="radio-custom"></span>
                <span class="radio-text">Female</span>
              </label>
            </div>
          </div>

        </div>
      </div>

      <!-- Edit Button -->
      <div class="actions">
        <button class="btn-edit">
          <i class="fa-solid fa-pen"></i>
          Edit Profile
        </button>
      </div>
    </main>

  </div>

</body>
</html>