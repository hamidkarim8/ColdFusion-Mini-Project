<!DOCTYPE html>
<html lang="en"> <!--begin::Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Test Project | User Record</title><!--begin::Primary Meta Tags-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="title" content="AdminLTE v4 | Dashboard">
    <meta name="author" content="ColorlibHQ">
    <meta name="description" content="AdminLTE is a Free Bootstrap 5 Admin Dashboard, 30 example pages using Vanilla JS.">
    <meta name="keywords" content="bootstrap 5, bootstrap, bootstrap 5 admin dashboard, bootstrap 5 dashboard, bootstrap 5 charts, bootstrap 5 calendar, bootstrap 5 datepicker, bootstrap 5 tables, bootstrap 5 datatable, vanilla js datatable, colorlibhq, colorlibhq dashboard, colorlibhq admin dashboard"><!--end::Primary Meta Tags--><!--begin::Fonts-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css" integrity="sha256-tXJfXfp6Ewt1ilPzLDtQnJV4hclT9XuaZUKyUvmyr+Q=" crossorigin="anonymous"><!--end::Fonts--><!--begin::Third Party Plugin(OverlayScrollbars)-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.3.0/styles/overlayscrollbars.min.css" integrity="sha256-dSokZseQNT08wYEWiz5iLI8QPlKxG+TswNRD8k35cpg=" crossorigin="anonymous"><!--end::Third Party Plugin(OverlayScrollbars)--><!--begin::Third Party Plugin(Bootstrap Icons)-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.min.css" integrity="sha256-Qsx5lrStHZyR9REqhUF8iQt73X06c8LGIUPzpOhwRrI=" crossorigin="anonymous"><!--end::Third Party Plugin(Bootstrap Icons)--><!--begin::Required Plugin(AdminLTE)-->
    <link rel="stylesheet" href="../../dist/css/adminlte.css"><!--end::Required Plugin(AdminLTE)--><!-- apexcharts -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.css" integrity="sha256-4MX+61mt9NVvvuPjUWdUdyfZfxSB1/Rf9WtqRHgG5S0=" crossorigin="anonymous"><!-- jsvectormap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/jsvectormap@1.5.3/dist/css/jsvectormap.min.css" integrity="sha256-+uGLJmmTKOqBr+2E6KDYs/NRsHxSkONXFHUL0fy2O/4=" crossorigin="anonymous">
</head> <!--end::Head--> <!--begin::Body-->

<body class="layout-fixed sidebar-expand-lg bg-body-tertiary"> <!--begin::App Wrapper-->
    <div class="app-wrapper"> 
        
        <cfif NOT session.isLoggedIn>
            <cflocation url="index.cfm">
        </cfif>

        <!--begin::Header-->
        <cfinclude template="templates/header.cfm">

        <!--begin::Aside-->
        <cfinclude template="templates/aside.cfm">

        <!--begin::App Main-->
        <main class="app-main"> <!--begin::App Content Header-->
            <div class="app-content-header"> <!--begin::Container-->
                <div class="container-fluid"> <!--begin::Row-->
                    <div class="row">
                        <div class="col-sm-6">
                            <h3 class="mb-0">
                                User Record
                            </h3>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-end">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    User Record
                                </li>
                            </ol>
                        </div>
                    </div> <!--end::Row-->
                </div> <!--end::Container-->
            </div> <!--end::App Content Header--> <!--begin::App Content-->
            <div class="app-content"> <!--begin::Container-->
                <div class="container-fluid"> <!--begin::Row-->

                <cfinclude template="actions/readUsers.cfm">

                <div class="card card-primary card-outline mb-4">
                    <div class="card-header">
                        <h3 class="card-title">Users</h3>
                    </div> <!-- /.card-header -->
                    <div class="card-body p-0">
                        <table class="table table-primary table-striped align-middle table-nowrap mb-0">
                            <thead>
                                <tr>
                                    <th scope="col">Username</th>
                                    <th scope="col">First Name</th>
                                    <th scope="col">Last Name</th>
                                    <th scope="col">Phone Number</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Role</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <cfoutput query="getUserRecords">
                                <tr>
                                    <td>#UserName#</td>
                                    <td>#FirstName#</td>
                                    <td>#LastName#</td>
                                    <td>#PhoneNumber#</td>
                                    <td>#Email#</td>
                                    <td>#RoleName#</td>
                                    <td>            
                                        <cfif Status EQ 'Active'>
                                        <span class="badge bg-success">Active</span>
                                        <cfelse>
                                            <span class="badge bg-danger">Inactive</span>
                                        </cfif>
                                    </td>
                                    <td>
                                        <div class="hstack gap-3 flex-wrap">
                                            <a href="javascript:void(0);" 
                                                class="link-primary fs-15 edit-user-btn" 
                                                data-userid="#UserID#" 
                                                data-username="#UserName#" 
                                                data-firstname="#FirstName#" 
                                                data-lastname="#LastName#" 
                                                data-phonenumber="#PhoneNumber#" 
                                                data-email="#Email#" 
                                                data-status="#Status#" 
                                                data-role="#RoleName#">
                                                <i class="bi bi-pencil-square"></i>
                                            </a><!-- update -->
                                            <cfif session.roleID NEQ 2>
                                                <a href="javascript:void(0);" class="link-danger fs-15 delete-user-btn" data-userid="#UserID#">
                                                    <i class="bi bi-trash"></i>
                                                </a><!-- delete -->
                                            </cfif>                                        
                                        </div>
                                    </td>
                                </tr>
                                </cfoutput>
                            </tbody>
                        </table>
                    </div> 
                </div> <!--end::Container-->
                <!-- Update User Modal -->
                <div class="modal fade" id="updateUserModal" tabindex="-1" aria-labelledby="updateUserModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="updateUserModalLabel">Update User</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="updateUserForm">
                                    <input type="hidden" id="updateUserId" name="userId">
                                    <div class="mb-3">
                                        <label for="updateUsername" class="form-label">Username</label>
                                        <input type="text" class="form-control" id="updateUsername" name="username" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="updateFirstName" class="form-label">First Name</label>
                                        <input type="text" class="form-control" id="updateFirstName" name="firstName" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="updateLastName" class="form-label">Last Name</label>
                                        <input type="text" class="form-control" id="updateLastName" name="lastName" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="updatePhoneNumber" class="form-label">Phone Number</label>
                                        <input type="text" class="form-control" id="updatePhoneNumber" name="phoneNumber" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="updateEmail" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="updateEmail" name="email" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="updateRole" class="form-label">Role</label>
                                        <select type="form-select" class="form-control" id="updateRole" name="role" required>
                                            <option value="1">Admin</option>
                                            <option value="2">Staff</option>
                                        </select>    
                                    </div>
                                    <div class="mb-3">
                                        <label for="updateStatus" class="form-label">Status</label>
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="updateStatus" name="status">
                                            <label class="form-check-label" for="updateStatus">
                                                Active
                                            </label>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Update User</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div> <!--end::App Content-->
        </main> <!--end::App Main--> 
        
        <!--begin::Footer-->
        <cfinclude template="templates/footer.cfm">

    </div> <!--end::App Wrapper--> <!--begin::Script--> <!--begin::Third Party Plugin(OverlayScrollbars)-->
    <script src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.3.0/browser/overlayscrollbars.browser.es6.min.js" integrity="sha256-H2VM7BKda+v2Z4+DRy69uknwxjyDRhszjXFhsL4gD3w=" crossorigin="anonymous"></script> <!--end::Third Party Plugin(OverlayScrollbars)--><!--begin::Required Plugin(popperjs for Bootstrap 5)-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha256-whL0tQWoY1Ku1iskqPFvmZ+CHsvmRWx/PIoEvIeWh4I=" crossorigin="anonymous"></script> <!--end::Required Plugin(popperjs for Bootstrap 5)--><!--begin::Required Plugin(Bootstrap 5)-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha256-YMa+wAM6QkVyz999odX7lPRxkoYAan8suedu4k2Zur8=" crossorigin="anonymous"></script> <!--end::Required Plugin(Bootstrap 5)--><!--begin::Required Plugin(AdminLTE)-->
    <script src="../../dist/js/adminlte.js"></script> <!--end::Required Plugin(AdminLTE)--><!--begin::OverlayScrollbars Configure-->
    <script>

        document.querySelectorAll('.edit-user-btn').forEach(button => {
            button.addEventListener('click', function () {
                const userId = this.dataset.userid;
                const username = this.dataset.username;
                const firstName = this.dataset.firstname;
                const lastName = this.dataset.lastname;
                const phoneNumber = this.dataset.phonenumber;
                const email = this.dataset.email;
                const status = this.dataset.status;
                let role = this.dataset.role;

                console.log(status);
                if (role === "Admin"){
                    role = "1";
                }else{
                    role = "2";
                }               

                document.getElementById('updateUserId').value = userId;
                document.getElementById('updateUsername').value = username;
                document.getElementById('updateFirstName').value = firstName;
                document.getElementById('updateLastName').value = lastName;
                document.getElementById('updatePhoneNumber').value = phoneNumber;
                document.getElementById('updateEmail').value = email;
                document.getElementById('updateRole').value = role;


                const updateRoleSelect = document.getElementById('updateRole');
                for (let option of updateRoleSelect.options) {
                    if (option.value === role) {
                        option.selected = true;
                        break;
                    }
                }

                const statusCheckbox = document.getElementById('updateStatus');
                statusCheckbox.checked = (status === 'Active');

                var updateModal = new bootstrap.Modal(document.getElementById('updateUserModal'));
                updateModal.show();
            });
        });

        document.querySelectorAll('.delete-user-btn').forEach(button => {
            button.addEventListener('click', function () {
                const userId = this.dataset.userid;

                if (confirm('Are you sure you want to delete this user?')) {
                    fetch('actions/deleteUser.cfm', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: new URLSearchParams({
                            'userId': userId,
                            'action': 'delete'
                        })
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            alert('User deleted successfully.');
                            location.reload();
                        } else {
                            alert('Error deleting user: ' + data.message);
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
                }
            });
        });

        document.getElementById('updateUserForm').addEventListener('submit', function (e) {
            e.preventDefault();

            const formData = new FormData(this);

            const statusCheckbox = document.getElementById('updateStatus');
            const statusValue = statusCheckbox.checked ? 'Active' : 'Inactive';
            formData.set('status', statusValue); 

            fetch('actions/updateUser.cfm', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('User updated successfully.');
                    location.reload();
                } else {
                    alert('Error updating user: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
        });
    </script>
</body><!--end::Body-->

</html>