<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
    <link rel="stylesheet" href="./css/style.css" />

<body>
<%@page import="com.UserDao"%>
<%@page import="com.SendEmail"%>
<%
	String name = request.getParameter("desc");
	%><%
	String desc = request.getParameter("pname");
	%><%
	String price = request.getParameter("price");
	%>
    <nav>
      <img src="./assets/Logo.svg" alt="Kratos.logo" class="logo" />
    </nav>
    <section class="payment-section">
      <div class="debit-card">
        <img src="./assets/kratos-big.svg" alt="" class="chip" />
        <img src="./assets/card-bg.svg" alt="" class="card-vec vec-left" />
        <img src="./assets/card-bg.svg" alt="" class="card-vec vec-right" />
        <div class="card-info">
          <div class="input-field" id="cnumber">
            <input
              type="text"
              name="cardno"
              pattern="[0-9 - \s]{2,25}"
              autocomplete="off"
              required
            />
            <label for="cardno"><span>Card Number</span></label>
          </div>
          <div class="input-field" id="expiry">
            <input
              type="text"
              name="expiry"
              pattern="[0-9 \s]{4}"
              autocomplete="off"
              required
            />
            <label for="expiry"><span>Expiry</span></label>
          </div>
          <div class="input-field" id="cvv">
            <input
              type="text"
              name="cvv"
              pattern="[0-9 \s]{3}"
              autocomplete="off"
              required
            />
            <label for="cvv"><span>C V V</span></label>
          </div>
          <div class="input-field" id="nameoncard">
            <input
              type="text"
              name="nameoncard"
              pattern="[A-Za-z@. \s]{2,25}"
              autocomplete="off"
              required
            />
            <label for="nameoncard"><span>Name on Card</span></label>
          </div>
          <a href="./paymentsuccess.html"><button class="cta form-btn">Proceed</button></a>
        </div>
      </div>
      <div class="debit-card bill">
        <img src="./assets/kratos-big.svg" alt="" class="chip" />
        <img src="./assets/card-bg.svg" alt="" class="card-vec vec-left" />
        <img src="./assets/card-bg.svg" alt="" class="card-vec vec-right" />
        <span><%out.println(name);%></span>
        <span><%out.println(desc); %></span>
        <span><%out.println(price); %></span>
      </div>
    </section>
    <img src="./assets/card-background-vector.svg" alt="" class="bg" />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"
      integrity="sha512-IQLehpLoVS4fNzl7IfH8Iowfm5+RiMGtHykgZJl9AWMgqx0AmJ6cRWcB+GaGVtIsnC4voMfm8f2vwtY+6oPjpQ=="
      crossorigin="anonymous"
    ></script>
    <script>
      var t1 = new gsap.timeline();
      t1.from(".debit-card", { y: 100, opacity: 0, duration: 1 }, "+=1.5")
        .from(
          ".bg",
          {
            x: -100,
            opacity: 0,
            duration: 2,
          },
          "-=1.8"
        )
        .from(
          ".input-field",
          {
            y: 100,
            opacity: 0,
            duration: 1,
            stagger: 0.3,
          },
          "-=1"
        )
        .from(".chip", { y: 100, opacity: 0, duration: 1 }, "-=1.3")
        .to(".chip", {
          y: -10,
          yoyo: true,
          repeat: -1,
          ease: Power1.easeInOut,
          duration: 1.5,
        });
    </script>
</body>
</html>