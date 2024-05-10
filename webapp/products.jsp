<%@ page import="java.util.List" %>
<%@ page import="mvc.products" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            background-image:url("https://t4.ftcdn.net/jpg/02/32/16/07/360_F_232160763_FuTBWDd981tvYEJFXpFZtolm8l4ct0Nz.jpg");
                background-size: cover; /* Cover the entire background */
    background-repeat: no-repeat; /* Prevent the image from repeating */
    background-position: center; /* Center the image */
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

       .header {
            height: 80px;
            width: 100%;
            background-color: #343a40;
            color: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px;
            box-sizing: border-box;
            margin-top: -16px;
        
        }

        .header .logo {
            font-size: 30px;
            font-weight: bold;
        }

        .cart {
            display: flex;
            background-color: white;
            justify-content: space-between;
            align-items: center;
            padding: 7px 10px;
            border-radius: 3px;
            width: 80px;
        }

        .cart p {
            height: 22px;
            width: 22px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 22px;
            background-color: #343a40;
            color: white;
            margin-left: 5px;
        }

        .container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            grid-gap: 20px;
            width: 100%;
            max-width: 1200px;
        }

        .box {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 15px;
            background-color: white;
        }

        .img-box {
            height: 180px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
        }

        .images {
            max-width: 100%;
            max-height: 100%;
            object-fit: cover;
            object-position: center;
        }
        .header .logo {
            height:70px;
            width :70px;
            border-radius:50px;
        }

        .bottom {
            text-align: center;
        }

        h2 {
            font-size: 20px;
            color: green;
            margin-bottom: 10px;
        }
        h1{
        color:white
        }

        button {
            width: 100%;
            border: none;
            border-radius: 5px;
            background-color: #343a40;
            padding: 7px 10px;
            cursor: pointer;
            color: white;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #333;
        }

        .view-cart-btn {
            margin-top: 20px;
            background-color: #343a40;
            color: white;
            border: none;
            border-radius: 3px;
            padding: 5px 10px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .view-cart-btn:hover {
            background-color: #333;
        }

        @media only screen and (max-width: 600px) {
            .header {
                padding: 10px;
            }

           

            .cart {
                width: 60px;
            }

            .box {
                padding: 10px;
            }
			
            h2 {
                font-size: 18px;
            }

            button {
                padding: 5px 8px;
            }

            .view-cart-btn {
                font-size: 12px;
                padding: 3px 6px;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <img src="shoplogo.jpg" class="logo">
        <center><h1>Online Shopping</h1></center>
        <button class="cart" onclick="window.location.href='AddToCartServlet'"><img src="cartimg.png" width="30px" height="30px"/><p id="count">0</p></button>
    </div>
	<br><br>
    <div class="container">
        <%
        List<mvc.products> products1 = (List<mvc.products>) request.getAttribute("products");
        if (products1 != null) {
            for (mvc.products product : products1) {
        %>
        <div class='box'>
            <div class='img-box'>
                <img class='images' src="<%= product.getimage() %>">
            </div>
            <div class='bottom'>
                <p><%= product.getname() %></p>
                <h2>$ <%= product.getprice() %>.00</h2>
                <button onclick="addtocart('<%= product.getpid() %>', '<%= product.getname() %>', '<%= product.getprice() %>','<%= product.getimage() %>')" class="btn btn-primary">Add to Cart</button>
            </div>
        </div>
        <%
            }
        }
        %>
    </div>

    <script src="https://kit.fontawesome.com/92d70a2fd8.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    function addtocart(id, name, price, image) {
        var pincode = prompt("Enter your pin code:");
        if (pincode && pincode.trim() !== "") {
            // Validate pin code and proceed
            if (parseInt(pincode) > 100001) {
                // Pin code is serviceable
                var data = {
                    productId: id,
                    productName: name,
                    productPrice: price,
                    productImage: image,
                    pincode: pincode
                };
        
                $.ajax({
                    type: "POST",
                    url: "AddToCartServlet",
                    data: data,
                    success: function(response) {
                        console.log(response);
                        alert("Item added");
                        // Increment the count
                        var countElement = document.getElementById("count");
                        var count = parseInt(countElement.textContent);
                        countElement.textContent = count + 1;
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText);
                        alert("Error");
                    }
                });
            } else {
                // Pin code is not serviceable
                alert("Sorry, we can't deliver to this pin code.");
            }
        }
    }

    // Calculate Total Bill
    function calculateBill(products) {
        var total = 0;
        products.forEach(function(product) {
            total += parseFloat(product.getprice());
        });

        // Calculate GST
        var gstRate = 18; // Assume GST rate is 18%
        var gstAmount = (total * gstRate) / 100;

        // Fetch Shipping Charges based on order value
        var orderValue = total;
        $.ajax({
            type: "POST",
            url: "GetShippingChargesServlet",
            data: { orderValue: orderValue },
            success: function(shippingCharges) {
                // Calculate Total Bill
                var totalBill = total + gstAmount + parseFloat(shippingCharges);
                alert("Total Bill: $" + totalBill.toFixed(2));
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
                alert("Error calculating shipping charges");
            }
        });
    }


    </script>
</body>
</html>