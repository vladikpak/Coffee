<#import "layout/main.ftlh" as layout>
<@layout.layout title="Contact — Brewly">

<div class="container py-5">
    <div class="row">
        <div class="col-lg-6">
            <h1 class="contact-title">Contact Us</h1>
            <p class="contact-subtitle">We'd love to hear from you!</p>

            <div class="contact-info">
                <div class="contact-item">
                    <span class="contact-icon">📞</span>
                    <div>
                        <h4>Phone</h4>
                        <p>+1 (555) 123-4567</p>
                    </div>
                </div>
                <div class="contact-item">
                    <span class="contact-icon">✉️</span>
                    <div>
                        <h4>Email</h4>
                        <p>hello@brewly.com</p>
                    </div>
                </div>
                <div class="contact-item">
                    <span class="contact-icon">📍</span>
                    <div>
                        <h4>Address</h4>
                        <p>Brewville, CA 90210</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="contact-form-card">
                <h3>Send us a message</h3>

                <#if success??>
                    <div class="alert alert-success">${success}</div>
                </#if>

                <#if error??>
                    <div class="alert alert-danger">${error}</div>
                </#if>

                <form action="/contact/send" method="post">
                    <div class="form-group">
                        <input type="text" name="name" class="form-control" placeholder="Your Name" required>
                    </div>
                    <div class="form-group">
                        <input type="email" name="email" class="form-control" placeholder="Your Email" required>
                    </div>
                    <div class="form-group">
                        <input type="text" name="subject" class="form-control" placeholder="Subject">
                    </div>
                    <div class="form-group">
                        <textarea name="message" class="form-control" rows="5" placeholder="Your Message" required></textarea>
                    </div>
                    <button type="submit" class="btn-send">Send Message →</button>
                </form>
            </div>
        </div>
    </div>
</div>

<style>
    .contact-title { font-size: 3rem; font-weight: 800; color: #2C1810; }
    .contact-subtitle { font-size: 1.2rem; color: #8B6B4D; margin-bottom: 30px; }
    .contact-info { display: flex; flex-direction: column; gap: 20px; }
    .contact-item { display: flex; align-items: center; gap: 20px; background: #fff; padding: 20px 25px; border-radius: 16px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
    .contact-icon { font-size: 2rem; flex-shrink: 0; }
    .contact-item h4 { font-size: 1rem; color: #2C1810; margin: 0; }
    .contact-item p { color: #8B6B4D; margin: 0; }
    .contact-form-card { background: #fff; padding: 35px; border-radius: 20px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
    .contact-form-card h3 { font-size: 1.5rem; color: #2C1810; margin-bottom: 20px; }
    .contact-form-card .form-control { border-radius: 12px; border: 1px solid #F5EDE6; padding: 12px 16px; margin-bottom: 15px; background: #FDF8F3; }
    .btn-send { padding: 12px 35px; border-radius: 30px; border: none; background: #D4A574; color: #fff; font-weight: 600; cursor: pointer; transition: all 0.3s ease; }
    .btn-send:hover { background: #A67B5B; }
</style>

</@layout.layout>