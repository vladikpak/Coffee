<#import "../layout/main.ftlh" as layout>
<@layout.layout title="My Profile">

<div class="profile-page">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">

                <div class="profile-card">
                    <!-- ===== ЗАГОЛОВОК ===== -->
                    <div class="profile-header">
                        <h2>My Profile</h2>
                        <a href="/profile/edit" class="btn-edit">
                            <i class="fas fa-edit"></i> Edit Profile
                        </a>
                    </div>

                    <!-- ===== АВАТАР ===== -->
                    <div class="profile-avatar">
                        <#if currentUser.image?? && currentUser.image != "">
                            <img src="${currentUser.image}" alt="Avatar">
                        <#else>
                            <div class="avatar-placeholder">
                                <i class="fas fa-user"></i>
                            </div>
                        </#if>
                    </div>

                    <!-- ===== ИМЯ ===== -->
                    <h3 class="profile-name">${currentUser.name!}</h3>
                    <span class="profile-role">
                        <#if currentUser.role??>
                            ${currentUser.role}
                        <#else>
                            User
                        </#if>
                    </span>

                    <hr>

                    <!-- ===== ИНФОРМАЦИЯ ===== -->
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

                    <!-- ===== СТАТИСТИКА ===== -->
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

                    <!-- ===== КНОПКИ ===== -->
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

<style>
    .profile-page {
        background: #FDF8F3;
        min-height: 70vh;
    }

    .profile-card {
        background: #fff;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        text-align: center;
    }

    .profile-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
        flex-wrap: wrap;
        gap: 10px;
    }

    .profile-header h2 {
        font-size: 1.8rem;
        color: #2C1810;
        font-weight: 700;
        margin: 0;
    }

    .btn-edit {
        padding: 8px 20px;
        border-radius: 30px;
        background: #D4A574;
        color: #fff;
        text-decoration: none;
        font-weight: 600;
        font-size: 0.9rem;
        transition: all 0.3s ease;
    }

    .btn-edit:hover {
        background: #A67B5B;
        color: #fff;
    }

    .profile-avatar {
        margin: 15px auto;
    }

    .profile-avatar img {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        object-fit: cover;
        border: 4px solid #D4A574;
    }

    .avatar-placeholder {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        background: #F5EDE6;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto;
        border: 4px solid #D4A574;
    }

    .avatar-placeholder i {
        font-size: 50px;
        color: #A67B5B;
    }

    .profile-name {
        font-size: 1.5rem;
        color: #2C1810;
        margin: 10px 0 5px;
    }

    .profile-role {
        display: inline-block;
        padding: 4px 16px;
        border-radius: 20px;
        font-size: 0.85rem;
        font-weight: 600;
        background: #F5EDE6;
        color: #8B6B4D;
    }

    .profile-info {
        text-align: left;
        max-width: 400px;
        margin: 0 auto;
    }

    .info-row {
        display: flex;
        justify-content: space-between;
        padding: 10px 0;
        border-bottom: 1px solid #F5EDE6;
    }

    .info-row:last-child {
        border-bottom: none;
    }

    .info-label {
        color: #8B6B4D;
        font-weight: 500;
    }

    .info-value {
        color: #2C1810;
        font-weight: 600;
    }

    .info-value.money {
        color: #28a745;
    }

    .role-badge {
        display: inline-block;
    }

    .badge-admin {
        background: #dc3545;
        color: #fff;
        padding: 2px 12px;
        border-radius: 12px;
        font-size: 0.8rem;
        font-weight: 600;
    }

    .badge-user {
        background: #6C63FF;
        color: #fff;
        padding: 2px 12px;
        border-radius: 12px;
        font-size: 0.8rem;
        font-weight: 600;
    }

    .profile-stats {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 15px;
        margin: 10px 0;
    }

    .stat-item {
        text-align: center;
        padding: 15px;
        background: #FDF8F3;
        border-radius: 12px;
    }

    .stat-number {
        display: block;
        font-size: 1.5rem;
        font-weight: 700;
        color: #D4A574;
    }

    .stat-label {
        font-size: 0.8rem;
        color: #8B6B4D;
    }

    .profile-actions {
        display: flex;
        gap: 12px;
        justify-content: center;
        flex-wrap: wrap;
        margin-top: 10px;
    }

    .profile-actions a {
        padding: 10px 25px;
        border-radius: 30px;
        text-decoration: none;
        font-weight: 600;
        font-size: 0.9rem;
        transition: all 0.3s ease;
    }

    .btn-edit-profile {
        background: #D4A574;
        color: #fff;
    }

    .btn-edit-profile:hover {
        background: #A67B5B;
        color: #fff;
    }

    .btn-orders {
        background: #2C1810;
        color: #fff;
    }

    .btn-orders:hover {
        background: #4A2C1A;
        color: #fff;
    }

    .btn-logout {
        background: transparent;
        color: #dc3545;
        border: 2px solid #dc3545;
    }

    .btn-logout:hover {
        background: #dc3545;
        color: #fff;
    }

    @media (max-width: 576px) {
        .profile-card {
            padding: 25px;
        }

        .profile-stats {
            grid-template-columns: repeat(2, 1fr);
        }

        .profile-header {
            flex-direction: column;
            text-align: center;
        }

        .profile-actions {
            flex-direction: column;
        }

        .profile-actions a {
            width: 100%;
            text-align: center;
        }
    }
</style>

</@layout.layout>