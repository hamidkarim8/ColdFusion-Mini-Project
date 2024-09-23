<!DOCTYPE html>
<html lang="en"> <!--begin::Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Test Project | Dashboard</title><!--begin::Primary Meta Tags-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="title" content="AdminLTE v4 | Dashboard">
    <meta name="author" content="ColorlibHQ">
    <meta name="description" content="AdminLTE is a Free Bootstrap 5 Admin Dashboard, 30 example pages using Vanilla JS.">
    <meta name="keywords" content="bootstrap 5, bootstrap, bootstrap 5 admin dashboard, bootstrap 5 dashboard, bootstrap 5 charts, bootstrap 5 calendar, bootstrap 5 datepicker, bootstrap 5 tables, bootstrap 5 datatable, vanilla js datatable, colorlibhq, colorlibhq dashboard, colorlibhq admin dashboard"><!--end::Primary Meta Tags--><!--begin::Fonts-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css" integrity="sha256-tXJfXfp6Ewt1ilPzLDtQnJV4hclT9XuaZUKyUvmyr+Q=" crossorigin="anonymous"><!--end::Fonts--><!--begin::Third Party Plugin(OverlayScrollbars)-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.3.0/styles/overlayscrollbars.min.css" integrity="sha256-dSokZseQNT08wYEWiz5iLI8QPlKxG+TswNRD8k35cpg=" crossorigin="anonymous"><!--end::Third Party Plugin(OverlayScrollbars)--><!--begin::Third Party Plugin(Bootstrap Icons)-->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" type="text/css" />
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
                                Dashboard
                            </h3>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-end">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Dashboard
                                </li>
                            </ol>
                        </div>
                    </div> <!--end::Row-->
                </div> <!--end::Container-->
            </div> <!--end::App Content Header--> <!--begin::App Content-->
            <div class="app-content"> <!--begin::Container-->
                <div class="container-fluid"> <!--begin::Row-->

                    <div class="card card-primary card-outline mb-4"> <!--begin::Header-->
                        <div class="card-header">
                            <div class="card-title">Select Fund</div>
                        </div> <!--end::Header--> <!--begin::Form-->
                        <form method="post" action="actions/insertFundName.cfm">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <h6 class="fw-semibold">Asset Class</h6>
                                            <select class="js-example-basic-multiple form-select" name="asset_class[]" data-placeholder="Select an Asset Class" multiple="multiple">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <h6 class="fw-semibold">Fund Management</h6>
                                            <select class="js-example-basic-multiple form-select" name="fund_management[]" data-placeholder="Select a Fund Management" multiple="multiple">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <h6 class="fw-semibold">Fund Name</h6>
                                            <select class="js-example-basic-single form-select" name="fund_name" data-placeholder="Select a Fund Name">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Submit button -->
                            <div class="card-footer">
                                <button type="submit" name="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                    </div> <!--end::Quick Example-->
                </div> <!--end::Container-->
            </div> <!--end::App Content-->
        </main> <!--end::App Main--> 
        
        <!--begin::Footer-->
        <cfinclude template="templates/footer.cfm">

    </div> <!--end::App Wrapper--> <!--begin::Script--> <!--begin::Third Party Plugin(OverlayScrollbars)-->
        <!--jquery cdn-->
        <script src="plugins/jquery/jquery.min.js"></script>
        <!--select2 cdn-->
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>   
    <script src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.3.0/browser/overlayscrollbars.browser.es6.min.js" integrity="sha256-H2VM7BKda+v2Z4+DRy69uknwxjyDRhszjXFhsL4gD3w=" crossorigin="anonymous"></script> <!--end::Third Party Plugin(OverlayScrollbars)--><!--begin::Required Plugin(popperjs for Bootstrap 5)-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha256-whL0tQWoY1Ku1iskqPFvmZ+CHsvmRWx/PIoEvIeWh4I=" crossorigin="anonymous"></script> <!--end::Required Plugin(popperjs for Bootstrap 5)--><!--begin::Required Plugin(Bootstrap 5)-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha256-YMa+wAM6QkVyz999odX7lPRxkoYAan8suedu4k2Zur8=" crossorigin="anonymous"></script> <!--end::Required Plugin(Bootstrap 5)--><!--begin::Required Plugin(AdminLTE)-->
 
    <script src="../../dist/js/adminlte.js"></script> <!--end::Required Plugin(AdminLTE)--><!--begin::OverlayScrollbars Configure-->
    <script>
        $(document).ready(function() {
            $('.js-example-basic-multiple').select2({ width: '100%' });
            $('.js-example-basic-single').select2({ width: '100%' });

            // Load Asset Classes
            $.ajax({
                url: 'actions/getAssetClasses.cfm',
                type: 'GET',
                success: function(data) {
                    var assetClasses = JSON.parse(data);
                    $.each(assetClasses, function(key, value) {
                        $('select[name="asset_class[]"]').append('<option value="'+value.ID+'">'+value.NAME+'</option>');
                    });
                }
            });

            // Load Fund Managers
            $.ajax({
                url: 'actions/getFundManagers.cfm',
                type: 'GET',
                success: function(data) {
                    var fundManagers = JSON.parse(data);
                    $.each(fundManagers, function(key, value) {
                        $('select[name="fund_management[]"]').append('<option value="'+value.ID+'">'+value.NAME+'</option>');
                    });
                }
            });

            function loadFundNames() {
                var selectedAssetClasses = $('select[name="asset_class[]"]').val() || [];
                var selectedFundManagers = $('select[name="fund_management[]"]').val() || [];
                var $fundNameSelect = $('select[name="fund_name"]');

                if (selectedAssetClasses.length === 0 && selectedFundManagers.length === 0) {
                    $fundNameSelect.empty();
                    return;
                }

                $.ajax({
                    url: 'actions/getFilteredFundNames.cfm',
                    type: 'POST',
                    data: {
                        assetClassIds: JSON.stringify(selectedAssetClasses),
                        fundManagerIds: JSON.stringify(selectedFundManagers)
                    },
                    success: function(data) {
                        var fundNames = JSON.parse(data);
                        $fundNameSelect.empty();
                        $.each(fundNames, function(key, value) {
                            $fundNameSelect.append('<option value="'+value.ID+','+value.NAME+'">'+value.NAME+'</option>');
                        });
                    }
                });
            }


            $('select[name="asset_class[]"], select[name="fund_management[]"]').on('change', loadFundNames);
        });


    </script>
</body><!--end::Body-->

</html>