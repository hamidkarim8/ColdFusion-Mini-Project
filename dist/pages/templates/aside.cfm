<aside class="app-sidebar bg-body-secondary shadow" data-bs-theme="dark"> <!--begin::Sidebar Brand-->
    <div class="sidebar-brand"> <!--begin::Brand Link--> <a href="./dashboard.cfm" class="brand-link"> <!--begin::Brand Image--> <img src="../../dist/assets/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image opacity-75 shadow"> <!--end::Brand Image--> <!--begin::Brand Text--> <span class="brand-text fw-light">Test Project</span> <!--end::Brand Text--> </a> <!--end::Brand Link--> </div> <!--end::Sidebar Brand-->
     <!--begin::Sidebar Wrapper-->
    <div class="sidebar-wrapper">
        <nav class="mt-2"> <!--begin::Sidebar Menu-->
            <ul class="nav sidebar-menu flex-column" data-lte-toggle="treeview" role="menu" data-accordion="false">
                <li class="nav-item"> <a href="./dashboard.cfm" class="nav-link"> <i class="nav-icon bi bi-circle"></i>
                    <p>Select Fund</p>
                </a> </li>
                <li class="nav-item"> <a href="./fundRecord.cfm" class="nav-link"> <i class="nav-icon bi bi-circle"></i>
                    <p>Fund Record</p>
                </a> </li>
                <cfif session.roleID EQ "1">
                    <li class="nav-item menu-close"> 
                        <a href="#" class="nav-link"> 
                            <i class="nav-icon bi bi-people"></i>
                            <p>
                                User Maintenance
                                <i class="nav-arrow bi bi-chevron-right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item"> 
                                <a href="./registerForm.cfm" class="nav-link"> 
                                    <i class="nav-icon bi bi-circle"></i>
                                    <p>User Registration</p>
                                </a> 
                            </li>
                            <li class="nav-item"> 
                                <a href="./userRecord.cfm" class="nav-link"> 
                                    <i class="nav-icon bi bi-circle"></i>
                                    <p>User Record</p>
                                </a> 
                            </li>
                        </ul>
                    </li>
                <cfelse>
                    <!-- Only show the User Record link if role is not 1 -->
                    <li class="nav-item"> 
                        <a href="./userRecord.cfm" class="nav-link"> 
                            <i class="nav-icon bi bi-circle"></i>
                            <p>User Record</p>
                        </a> 
                    </li>
                </cfif>
            </ul> <!--end::Sidebar Menu-->
        </nav>
    </div> <!--end::Sidebar Wrapper-->
</aside> <!--end::Sidebar--> 