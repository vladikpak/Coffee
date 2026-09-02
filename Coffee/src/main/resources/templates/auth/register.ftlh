<#import "../layout/main.ftlh" as layout>
<@layout.layout title="Register">

<div class="auth-page">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-5">
                <div class="auth-card">
                    <div class="text-center mb-4">
                        <h2>☕ Create Account</h2>
                        <p class="text-secondary">Join the Brewly community.</p>
                    </div>

                    <#if error??>
                        <div class="alert alert-danger">${error}</div>
                    </#if>

                    <form action="/register" method="post">
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" name="name" class="form-control" placeholder="John Doe" required>
                        </div>

                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control" placeholder="you@example.com" required>
                        </div>

                        <div class="form-group">
                            <label>Phone</label>
                            <input type="tel" name="phone" class="form-control" placeholder="+1 (555) 000-0000" required>
                        </div>

                        <!-- ===== ВЫБОР РОЛИ ===== -->
                        <div class="form-group">
                            <label>Role</label>
                            <select name="role" class="form-control" required>
                                <option value="User">User</option>
                                <option value="Admin">Admin</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="password" class="form-control" placeholder="••••••••" required>
                        </div>

                        <div class="form-group">
                            <label>Confirm Password</label>
                            <input type="password" name="confirmPassword" class="form-control" placeholder="••••••••" required>
                        </div>

                        <button type="submit" class="btn-auth w-100">Create Account →</button>
                    </form>

                    <div class="text-center mt-3">
                        <p>Already have an account? <a href="/login">Sign in</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .auth-page { background: #FDF8F3; min-height: 70vh; display: flex; align-items: center; }
    .auth-card { background: #fff; padding: 40px; border-radius: 20px; box-shadow: 0 4px 20px rgba(0,0,0,0.06); width: 100%; }
    .auth-card h2 { font-size: 1.8rem; color: #2C1810; }
    .auth-card .form-group { margin-bottom: 18px; }
    .auth-card .form-group label { font-weight: 600; color: #2C1810; }
    .auth-card .form-control { border-radius: 12px; border: 1px solid #F5EDE6; padding: 12px 16px; background: #FDF8F3; }
    .auth-card .form-control:focus { border-color: #D4A574; box-shadow: 0 0 0 3px rgba(212,165,116,0.1); }
    .btn-auth { padding: 14px; border-radius: 30px; border: none; background: #D4A574; color: #fff; font-weight: 700; font-size: 1.1rem; cursor: pointer; transition: all 0.3s ease; }
    .btn-auth:hover { background: #A67B5B; }
</style>

</@layout.layout>