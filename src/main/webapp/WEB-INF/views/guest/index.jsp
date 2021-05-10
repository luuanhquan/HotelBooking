<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<body id="page-top">
<div class="container-fluid">

    <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Guest</h1>
            <a href="create" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                <i class="fas fa-plus"></i>Add Guest</a>
        </div>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Guest List</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Gender</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Phone number</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listguest}" var="g">
                            <tr>
                                <td>${g.id}</td>
                                <td><c:if test="${not g.gender}">Female</c:if><c:if test="${g.gender}">Male</c:if> </td>
                                <td>${g.firstName}</td>
                                <td>${g.lastName}</td>
                                <td>${g.address}</td>
                                <td>${g.email}</td>
                                <td>${g.phone}</td>

                                <td>
                                    <a href="edit/${g.id}" type="button"
                                       rel="tooltip" title="Edit" class="btn btn-info btn-simple btn-xs">

                                    <i>Edit</i>
                                    </a>

                                    <a href="edit/${g.id}" type="button"
                                       rel="tooltip" title="Edit" class="btn btn-info btn-simple btn-xs">
                                        <i>Change Password</i>
                                    </a>

                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</body>
