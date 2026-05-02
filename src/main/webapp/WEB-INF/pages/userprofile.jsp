<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<jsp:include page="navbar.jsp"/>
  <div class="page-wrapper">
  <!-- Sidebar -->
<jsp:include page="sidebar.jsp" />

    <!-- Main Content -->
    <div class="main-content">
      <form action="${pageContext.request.contextPath}/user" method="post" enctype="multipart/form-data">
        <div class="profile-card">

          <div class="avatar-section">
            <div class="avatar-wrapper">
              <img 
              id="profileImagePreview"
              src="<%=request.getContextPath()%>/uploads/${sessionScope.loggedInUser.user_img}" 
              alt="Profile Photo" 
              class="avatar-img" />
              
             <c:if test="${param.mode == 'edit'}">
             <label for="updateProfilePhoto" class="avatar-edit-btn" title="Change photo">
                <i class="fa-solid fa-camera"></i>
              </label>
             </c:if>
              
              <input id="updateProfilePhoto"  name="updateProfilePhoto" type="file" hidden>
            </div>
          </div>

          <div class="form-section">
            <div class="form-grid">

              <div class="form-group">
                <label class="form-label" for="firstName">First Name</label>
                <input class="form-input" 
                type="text" 
                id="firstName" 
                name="firstName" 
                value="${sessionScope.loggedInUser.user_first_name}" 
                placeholder="First name" 
                ${param.mode == 'edit' ? '' : 'disabled' }
                 />
              </div>

              <div class="form-group">
                <label class="form-label" for="lastName">Last Name</label>
                <input class="form-input" 
                type="text" id="lastName" 
                name="lastName" 
                value="${sessionScope.loggedInUser.user_last_name}" 
                placeholder="Last name" 
                ${param.mode == 'edit' ? '' : 'disabled' } />
              </div>

              <div class="form-group">
                <label class="form-label" for="email">Email</label>
                <input class="form-input" 
                type="email" id="email" 
                name="email" 
                value="${sessionScope.loggedInUser.user_email}" 
                placeholder="Email address" 
                ${param.mode == 'edit' ? '' : 'disabled' }/>
              </div>

              <div class="form-group">
                <label class="form-label" for="phone">Phone Number</label>
                <input class="form-input" 
                type="tel" 
                id="phone" 
                name="phone" 
                value="${sessionScope.loggedInUser.user_phone_number}" 
                placeholder="Phone number"
                ${param.mode == 'edit' ? '' : 'disabled' } />
              </div>

            </div>

            <div class="gender-group">
              <label class="form-label">Gender</label>
              <div class="radio-group">
                <label class="radio-label">
                  <input type="radio" 
                  class="${param.mode == 'edit' ? '' : 'radioDisabled' }"
                  name="gender" 
                  value="male" ${sessionScope.loggedInUser.user_gender == 'male' ? 'checked' : ''}
                  ${param.mode == 'edit' ? '' : 'disabled' } />
                  <span class="radio-custom"></span>
                  <span class="radio-text">Male</span>
                </label>
                <label class="radio-label">
                  <input type="radio" 
                   class="${param.mode == 'edit' ? '' : 'radioDisabled' }"
                  name="gender" 
                  value="female" ${sessionScope.loggedInUser.user_gender == 'female' ? 'checked' : ''}
                  ${param.mode == 'edit' ? '' : 'disabled' } />
                  <span class="radio-custom"></span>
                  <span class="radio-text">Female</span>
                </label>
                <label class="radio-label">
                  <input type="radio" 
                   class="${param.mode == 'edit' ? '' : 'radioDisabled' }"
                  name="gender" 
                  value="others" ${sessionScope.loggedInUser.user_gender == 'others' ? 'checked' : ''}
                  ${param.mode == 'edit' ? '' : 'disabled' } />
                  <span class="radio-custom"></span>
                  <span class="radio-text">Others</span>
                </label>
              </div>
            </div>

          </div>
        </div>
        <c:if test="${not empty requestScope.errorMessage}">
        <p class="errorMsg">${requestScope.errorMessage}</p>
      </c:if>
        <div class="actions">
          <c:if test="${param.mode != 'edit'}">
        <a href="?mode=edit" class="btn-edit">
            <i class="fa-solid fa-pen"></i>
            Edit Profile
        </a>
    </c:if>
    
    <c:if test="${param.mode == 'edit'}">
     
        <div class="buttonGroup">
        <button type="submit" class="btn-edit">
            <i class="fa-solid fa-save"></i>
            Save Changes
        </button>
        <a class="btn-cancel" href="?" class="btn-cancel">
           <i class="fa-solid fa-xmark"></i> Cancel
        </a>
        </div>
        
    </c:if>

        </div>

      </form>
    </div>

</div>

<jsp:include page="footer.jsp"/>
<script>
	document.getElementById("updateProfilePhoto").addEventListener("change", (event)=> {
    const file = event.target.files[0];

    if (file) {
        const reader = new FileReader();

        reader.onload = (e) => {
            document.getElementById("profileImagePreview").src = e.target.result;
        };

        reader.readAsDataURL(file);
    }
});
</script>
</body>
</html>