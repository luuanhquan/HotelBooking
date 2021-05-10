<body id="page-top">

<div class="container-fluid">

    <!-- Page Heading -->
    <div class="card shadow mb-4">

        <form >
            <div class="form-group">
                <label>First Name</label>
                <input type="text" class="form-control" id="firstName" aria-describedby="emailHelp"
                       value="${g.firstName}">
            </div>
            <div class="form-group">
                <label >Last Name</label>
                <input type="text" class="form-control" id="lastName" aria-describedby="emailHelp"
                       value="${g.lastName}">
            </div>
            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="gridCheck">
                    <label class="form-check-label" for="gridCheck">
                        Male
                    </label>
                </div>
                <div class="form-group">
                    <label >Address</label>
                    <input type="text" class="form-control" id="address" aria-describedby="emailHelp"
                           value="${g.address}">
                </div>
                <div class="form-group">
                    <label >Email</label>
                    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" value="${g.email}">
                </div>
                <div class="form-group">
                    <label >Phone</label>
                    <input type="number" class="form-control" id="phone" aria-describedby="emailHelp" value="${g.phone}">
                </div>
                <div class="form-group">
                    <label >Password</label>
                    <input type="password" class="form-control" id="password" aria-describedby="emailHelp" value="${g.password}">
                </div>
                <button type="submit" formmethod="post" class="btn btn-primary">Create</button>
            </div>
        </form>
    </div>

</div>
<!-- End of Main Content -->


</body>


