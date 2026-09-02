<#macro layout title="Brewly Coffee">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title} — Brewly Coffee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<!-- ===== НАВИГАЦИЯ ===== -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="/">
            <span class="brand-icon">☕</span> Brewly
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/menu">Menu</a></li>
                <li class="nav-item"><a class="nav-link" href="/process">Process</a></li>
                <li class="nav-item"><a class="nav-link" href="/story">Our Story</a></li>
                <li class="nav-item"><a class="nav-link" href="/specialty">Specialty</a></li>
                <li class="nav-item"><a class="nav-link" href="/about">About</a></li>
                <li class="nav-item"><a class="nav-link" href="/contact">Contact</a></li>
            </ul>

            <div class="navbar-nav">

            <#if isAuthenticated?? && isAuthenticated && currentUser.role == "Admin">
                <li class="nav-item">
                    <a class="nav-link" href="/admin/contacts">
                        <i class="fas fa-envelope me-1"></i>
                        Messages
                        <#if newMessagesCount?? && newMessagesCount gt 0>
                            <span class="badge bg-danger">${newMessagesCount}</span>
                        </#if>
                    </a>
                </li>
            </#if>

                <#if isAuthenticated?? && isAuthenticated>
                 <a href="/profile" class="nav-link profile-link" title="My Profile">
                    <i class="fas fa-user-circle"></i>
                 <span class="profile-name-nav">${currentUser.name!}</span>
                 </a>
                 <a href="/profile/messages" class="btn btn-outline-primary">
                    <i class="fas fa-envelope me-2"></i>Мои сообщения
                 </a>
                 <a href="/logout" class="nav-link text-danger logout-link">
                    <i class="fas fa-sign-out-alt"></i>
                 </a>

                <#else>
                    <a href="/login" class="nav-link">Login</a>
                    <a href="/register" class="btn btn-outline-light btn-sm ms-2">Sign Up</a>
                </#if>
            </div>
        </div>
    </div>
</nav>

<!-- ===== КОНТЕНТ ===== -->
<#nested>

<!-- ===== FOOTER ===== -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <h5>☕ Brewly</h5>
                <p>Great coffee. Honest ingredients. Warm service. Always.</p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
            <div class="col-lg-2">
                <h6>Quick Links</h6>
                <ul>
                    <li><a href="/menu">Menu</a></li>
                    <li><a href="/about">About</a></li>
                    <li><a href="/contact">Contact</a></li>
                </ul>
            </div>
            <div class="col-lg-2">
                <h6>Support</h6>
                <ul>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms of Service</a></li>
                </ul>
            </div>
            <div class="col-lg-4">
                <h6>Newsletter</h6>
                <p>Subscribe for updates and special offers.</p>
                <form class="footer-newsletter">
                    <input type="email" placeholder="Your email">
                    <button type="submit">→</button>
                </form>
            </div>
        </div>
        <hr>
        <div class="text-center">
            <small>© 2024 Brewly Coffee House. All rights reserved.</small>
        </div>
    </div>
</footer>

<style>
    body {
        background: #FDF8F3;
        font-family: 'Segoe UI', sans-serif;
    }
    .navbar {
        background: #2C1810;
        padding: 15px 0;
    }
    .navbar-brand {
        font-size: 1.5rem;
        font-weight: 700;
    }
    .brand-icon {
        font-size: 1.8rem;
    }
    .navbar-nav .nav-link {
        color: rgba(255,255,255,0.7) !important;
        font-weight: 500;
        padding: 8px 16px;
        transition: all 0.3s ease;
    }
    .navbar-nav .nav-link:hover {
        color: #D4A574 !important;
    }
    .footer {
        background: #2C1810;
        color: rgba(255,255,255,0.7);
        padding: 50px 0 20px;
        margin-top: 40px;
    }
    .footer h5, .footer h6 {
        color: #fff;
    }
    .footer ul {
        list-style: none;
        padding: 0;
    }
    .footer ul li a {
        color: rgba(255,255,255,0.6);
        text-decoration: none;
        font-size: 0.9rem;
        transition: all 0.3s ease;
    }
    .footer ul li a:hover {
        color: #D4A574;
    }
    .social-icons {
        display: flex;
        gap: 15px;
        margin-top: 15px;
    }
    .social-icons a {
        color: rgba(255,255,255,0.6);
        font-size: 1.3rem;
        transition: all 0.3s ease;
    }
    .social-icons a:hover {
        color: #D4A574;
        transform: translateY(-3px);
    }
    .footer-newsletter {
        display: flex;
        gap: 5px;
    }
    .footer-newsletter input {
        flex: 1;
        padding: 8px 15px;
        border-radius: 30px;
        border: 1px solid rgba(255,255,255,0.1);
        background: rgba(255,255,255,0.05);
        color: #fff;
        outline: none;
    }
    .footer-newsletter input::placeholder {
        color: rgba(255,255,255,0.3);
    }
    .footer-newsletter button {
        padding: 8px 18px;
        border-radius: 30px;
        border: none;
        background: #D4A574;
        color: #fff;
        font-weight: 700;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    .footer-newsletter button:hover {
        background: #A67B5B;
    }
    .footer hr {
        border-color: rgba(255,255,255,0.05);
        margin: 20px 0;
    }
    .footer small {
        opacity: 0.5;
    }
    @media (max-width: 768px) {
        .navbar-nav {
            text-align: center;
        }
        .footer .row {
            text-align: center;
        }
        .social-icons {
            justify-content: center;
        }
        .footer-newsletter {
            flex-direction: column;
        }
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
</#macro>