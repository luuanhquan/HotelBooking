<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<body id="page-top">
<div class="container-fluid">

    <!-- Page Heading -->

        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Booking</h1>
            <a href="create" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                <i class="fas fa-plus"></i> Create Booking</a>
        </div>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Booking List</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Booker</th>
                            <th>Room type</th>
                            <th>Check In</th>
                            <th>Check Out</th>
                            <th>Remarks</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listbooking}" var="bk">
                            <tr>
                                <td>${bk.id}</td>
                                <td>${bk.guest.firstName}, ${bk.guest.lastName}</td>
                                <td>${bk.roomType.roomType}</td>
                                <td>${bk.checkIn}</td>
                                <td>${bk.checkOut}</td>
                                <td>${bk.remark}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${bk.status ==0}">Pending</c:when>
                                        <c:when test="${bk.status ==1}">Confirm</c:when>
                                        <c:when test="${bk.status ==2}">Checked Out</c:when>
                                        <c:when test="${bk.status ==3}"><p style="color:red">Deleted</p></c:when>
                                    </c:choose>
                                </td>
                                <td><a href="edit/${bk.id}" type="button"
                                       rel="tooltip" title="Edit" class="btn btn-info btn-simple btn-xs">
                                    <i>
                                        Edit
                                    </i>
                                </a>
                                    <c:if  test="${bk.status != 3}">
                                        <a href="delete/${bk.id}"
                                        onclick="return confirm('Delete booking?')" type="button"
                                        rel="tooltip" title="Delete" class="btn btn-danger btn-simple btn-xs">
                                        <i>Delete</i>
                                        </a>
                                    </c:if>
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
