<#import "../layout/main.ftlh" as layout>
<@layout.layout title="Edit Profile">

<div class="edit-page">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">

                <div class="edit-card">
                    <div class="edit-header">
                        <h2>Edit Profile</h2>
                        <a href="/profile" class="btn-back">← Back</a>
                    </div>

                    <#if success??>
                        <div class="alert alert-success">${success}</div>
                    </#if>

                    <#if error??>
                        <div class="alert alert-danger">${error}</div>
                    </#if>

                    <form action="/profile/edit" method="post" enctype="multipart/form-data">

                        <!-- Аватар -->
                        <div class="form-group text-center">
                            <div class="avatar-upload">
                                <#if currentUser.image?? && currentUser.image != "">
                                    <img src="${currentUser.image}" alt="Avatar" id="avatarPreview">
                                <#else>
                                    <div class="avatar-placeholder" id="avatarPreview">
                                        <i class="fas fa-user"></i>
                                    </div>
                                </#if>
                                <label for="avatar" class="btn-upload">
                                    <i class="fas fa-camera"></i>
                                </label>
                                <input type="file" name="avatar" id="avatar" accept="image/*" onchange="previewAvatar(event)">
                            </div>
                            <p class="text-secondary small">Click camera icon to change avatar</p>
                        </div>

                        <!-- Name -->
                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text" name="name" class="form-control" value="${currentUser.name!}" required>
                        </div>

                        <!-- Email -->
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control" value="${currentUser.email!}" required>
                        </div>

                        <!-- Phone -->
                        <div class="form-group">
                            <label>Phone</label>
                            <input type="tel" name="phone" class="form-control" value="${currentUser.phone!}" required>
                        </div>

                        <!-- Password -->
                        <hr>
                        <h5>Change Password</h5>
                        <p class="text-secondary small">Leave empty if you don't want to change</p>

                        <div class="form-group">
                            <label>New Password</label>
                            <input type="password" name="password" class="form-control" placeholder="••••••••">
                        </div>

                        <div class="form-group">
                            <label>Confirm Password</label>
                            <input type="password" name="confirmPassword" class="form-control" placeholder="••••••••">
                        </div>

                        <button type="submit" class="btn-save">Save Changes →</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function previewAvatar(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const preview = document.getElementById('avatarPreview');
            if (preview.tagName === 'DIV') {
                preview.innerHTML = '<img src="' + e.target.result + '" alt="Avatar" style="width: 100%; height: 100%; border-radius: 50%; object-fit: cover;">';
            } else {
                preview.src = e.target.result;
            }
        }
        reader.readAsDataURL(file);
    }
}
</script>

<style>
    .edit-page { background: #FDF8F3; min-height: 70vh; }
    .edit-card { background: #fff; padding: 40px; border-radius: 20px; box-shadow: 0 4px 20px rgba(0,0,0,0.06); }
    .edit-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px; }
    .edit-header h2 { font-size: 1.8rem; color: #2C1810; font-weight: 700; margin: 0; }
    .btn-back { color: #8B6B4D; text-decoration: none; font-weight: 600; transition: all 0.3s ease; }
    .btn-back:hover { color: #2C1810; }
    .edit-card .form-group { margin-bottom: 18px; }
    .edit-card label { font-weight: 600; color: #2C1810; }
    .edit-card .form-control { border-radius: 12px; border: 1px solid #F5EDE6; padding: 12px 16px; background: #FDF8F3; }
    .edit-card .form-control:focus { border-color: #D4A574; box-shadow: 0 0 0 3px rgba(212,165,116,0.1); }
    .avatar-upload { position: relative; display: inline-block; }
    .avatar-upload img { width: 120px; height: 120px; border-radius: 50%; object-fit: cover; border: 4px solid #D4A574; }
    .avatar-placeholder { width: 120px; height: 120px; border-radius: 50%; background: #F5EDE6; display: flex; align-items: center; justify-content: center; border: 4px solid #D4A574; }
    .avatar-placeholder i { font-size: 50px; color: #A67B5B; }
    .btn-upload { position: absolute; bottom: 5px; right: 5px; width: 35px; height: 35px; border-radius: 50%; background: #D4A574; color: #fff; border: none; display: flex; align-items: center; justify-content: center; cursor: pointer; transition: all 0.3s ease; font-size: 0.9rem; }
    .btn-upload:hover { background: #A67B5B; }
    .btn-save { width: 100%; padding: 14px; border-radius: 30px; border: none; background: #D4A574; color: #fff; font-weight: 700; font-size: 1.1rem; cursor: pointer; transition: all 0.3s ease; }
    .btn-save:hover { background: #A67B5B; }
</style>

</@layout.layout>