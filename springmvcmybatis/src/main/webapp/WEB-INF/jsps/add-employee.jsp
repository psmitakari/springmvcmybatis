<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Add Employee</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <!-- Optional: Add your own styles here -->
    <style>
        /* Add your custom styles here */
        body {
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mt-4">Add Employee</h1>
        <s:form modelAttribute="employee" action="saveProcess" class="mt-3">
            <input type="hidden" value="${employee.hobbies}" id="hiddenTxt"/>
            <s:hidden path="id" />
            
            <div class="form-group">
                <label for="fullname">Employee Name:</label>
                <s:input path="fullname" class="form-control"/>
            </div>
            
            <div class="form-group">
                <label for="email">Employee Email:</label>
                <s:input path="email" class="form-control"/>
            </div>
            
            <div class="form-group">
                <label>Gender:</label>
                <div class="form-check">
                    <s:radiobutton path="gender" value="Male" class="form-check-input"/> Male
                </div>
                <div class="form-check">
                    <s:radiobutton path="gender" value="Female" class="form-check-input"/> Female
                </div>
            </div>
            
            <div class="form-group">
                <label>Interests:</label>
                <div class="form-check">
                    <s:checkbox path="hobbies" value="Sports" class="form-check-input"/> Sports
                </div>
                <div class="form-check">
                    <s:checkbox path="hobbies" value="Books" class="form-check-input"/> Books
                </div>
                <div class="form-check">
                    <s:checkbox path="hobbies" value="Swimming" class="form-check-input"/> Swimming
                </div>
                <div class="form-check">
                    <s:checkbox path="hobbies" value="Cycling" class="form-check-input"/> Cycling
                </div>
                <div class="form-check">
                    <s:checkbox path="hobbies" value="Dancing" class="form-check-input"/> Dancing
                </div>
                
            </div>
            
            <div class="form-group">
                <label for="country">Country:</label>
                <s:select path="country" class="form-control">
                    <s:option value="India">India</s:option>
                    <s:option value="Australia">Australia</s:option>
                    <s:option value="South Africa">South Africa</s:option>
                    <s:option value="America">America</s:option>
                    <s:option value="Japan">Japan</s:option>
                </s:select>
            </div>
            
            <div class="form-group">
                <label for="address">Address:</label>
                <s:textarea path="address" class="form-control"></s:textarea>
            </div>
            
            <button type="submit" class="btn btn-primary">Save Employee</button>
        </s:form>
    </div>

    <!-- Bootstrap JS and Popper.js (for Bootstrap features like dropdowns) -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
    <script>
        $(document).ready(function(){
            var hobbies = $("#hiddenTxt").val().split(",");
            var $checkboxes = $("input[type=checkbox]");
            $checkboxes.each(function(idx,element){
                if(hobbies.indexOf(element.value) != -1){
                    element.setAttribute("checked", "checked");
                } else {
                    element.removeAttribute("checked");
                }
            });
        });
    </script>
</body>
</html>
