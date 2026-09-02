<#import "../layout/main.ftlh" as layout>
<@layout.layout title="Login — Brewly">

<div class="auth-page">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-5">
                <div class="auth-card">
                    <div class="text-center mb-4">
                        <h2>☕ Welcome Back</h2>
                        <p class="text-secondary">Sign in to continue your coffee journey.</p>
                    </div>

                    <#if error??>
                        <div class="alert alert-danger">${error}</div>
                    </#if>
                    <#if logout??>
                        <div class="alert alert-success">${logout}</div>
                    </#if>

                    <form action="/login" method="post">
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="username" class="form-control" placeholder="you@example.com" required>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="password" class="form-control" placeholder="••••••••" required>
                        </div>
                        <div class="form-check mb-3">
                            <input type="checkbox" name="remember-me" class="form-check-input" id="remember">
                            <label class="form-check-label" for="remember">Remember me</label>
                        </div>
                        <button type="submit" class="btn-auth">Sign In →</button>
                    </form>

                    <div class="text-center mt-3">
                        <p>Don't have an account? <a href="/register">Sign up</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .auth-page {
        background: #FDF8F3;
        min-height: 70vh;
        display: flex;
        align-items: center;
    }
    .auth-card {
        background: #fff;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        width: 100%;
    }
    .auth-card h2 {
        font-size: 1.8rem;
        color: #2C1810;
    }
    .auth-card .form-group {
        margin-bottom: 18px;
    }
    .auth-card .form-group label {
        font-weight: 600;
        color: #2C1810;
    }
    .auth-card .form-control {
        border-radius: 12px;
        border: 1px solid #F5EDE6;
        padding: 12px 16px;
        background: #FDF8F3;
    }
    .btn-auth {
        width: 100%;
        padding: 14px;
        border-radius: 30px;
        border: none;
        background: #D4A574;
        color: #fff;
        font-weight: 700;
        font-size: 1.1rem;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    .btn-auth:hover {
        background: #A67B5B;
    }
</style>

</@layout.layout>