<#import "../layout/main.ftlh" as layout>
<@layout.layout title="My Profile">

<div class="profile-page">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">

                <div class="profile-card">
                    <div class="profile-header">
                        <h2>My Profile</h2>
                        <a href="/profile/edit" class="btn-edit">
                            <i class="fas fa-edit"></i> Edit Profile
                        </a>
                    </div>

                    <div class="profile-avatar">
                        <#if currentUser.image?? && currentUser.image != "">
                            <img src="${currentUser.image}" alt="Avatar">
                        <#else>
                            <div class="avatar-placeholder">
                                <i class="fas fa-user"></i>
                            </div>
                        </#if>
                    </div>

                    <h3 class="profile-name">${currentUser.name!}</h3>
                    <span class="profile-role">
                        <#if currentUser.role??>
                            ${currentUser.role}
                        <#else>
                            User
                        </#if>
                    </span>

                    <hr>

                    <div class="profile-info">
                        <div class="info-row">
                            <span class="info-label">Email</span>
                            <span class="info-value">${currentUser.email!}</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Phone</span>
                            <span class="info-value">${currentUser.phone!}</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Balance</span>
                            <span class="info-value money">$${currentUser.money!0}</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Role</span>
                            <span class="info-value role-badge">
                                <#if currentUser.role?? && currentUser.role == "Admin">
                                    <span class="badge-admin">Admin</span>
                                <#else>
                                    <span class="badge-user">User</span>
                                </#if>
                            </span>
                        </div>
                    </div>

                    <hr>

                    <div class="profile-stats">
                        <div class="stat-item">
                            <span class="stat-number">12</span>
                            <span class="stat-label">Orders</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">${currentUser.money!0}</span>
                            <span class="stat-label">Balance</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">5</span>
                            <span class="stat-label">Reviews</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">98%</span>
                            <span class="stat-label">Completion</span>
                        </div>
                    </div>

                    <hr>

                    <div class="profile-actions">
                        <a href="/profile/edit" class="btn-edit-profile">
                            <i class="fas fa-edit"></i> Edit Profile
                        </a>
                        <a href="/order/my" class="btn-orders">
                            <i class="fas fa-shopping-bag"></i> My Orders
                        </a>
                        <a href="/logout" class="btn-logout">
                            <i class="fas fa-sign-out-alt"></i> Logout
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</@layout.layout>