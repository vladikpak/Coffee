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

</@layout.layout>