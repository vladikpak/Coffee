<#import "layout/main.ftlh" as layout>
<@layout.layout title="Home">

<section class="hero">
    <div class="container">
        <div class="hero-content">
            <h1>Brewed to <span>Perfection</span></h1>
            <p>Every cup is crafted with premium beans and passion for a richer experience.</p>
            <a href="/menu" class="btn-hero">Explore Our Menu →</a>
        </div>
    </div>
</section>

<section class="promo">
    <div class="container">
        <div class="promo-box">
            <div class="promo-icon">🥐</div>
            <div>
                <h3>Get 1 Free Croissant</h3>
                <p>with any coffee today!</p>
            </div>
        </div>
    </div>
</section>

<section class="featured">
    <div class="container">
        <h2 class="section-title">Featured Drinks</h2>
        <p class="section-sub">Handpicked favorites, crafted with care.</p>

        <div class="drinks-grid">
            <div class="drink-card">
                <div class="drink-icon">☕</div>
                <h4>Espresso Masterpiece</h4>
                <p>Bold and rich espresso with a perfect crema.</p>
                <div class="drink-price">$2.90</div>
                <a href="/order/create?coffeeId=1" class="btn-order">Order Now</a>
            </div>
            <div class="drink-card">
                <div class="drink-icon">🧊</div>
                <h4>Iced Favorites</h4>
                <p>Chilled, smooth, and perfect for any day.</p>
                <div class="drink-price">$3.80</div>
                <a href="/order/create?coffeeId=2" class="btn-order">Order Now</a>
            </div>
            <div class="drink-card">
                <div class="drink-icon">☕</div>
                <h4>Coffee Favorites</h4>
                <p>Timeless classics that warm your soul.</p>
                <div class="drink-price">$3.50</div>
                <a href="/order/create?coffeeId=3" class="btn-order">Order Now</a>
            </div>
            <div class="drink-card">
                <div class="drink-icon">🌱</div>
                <h4>Organic Beans</h4>
                <p>Sustainably sourced and full of flavor.</p>
                <div class="drink-price">$3.90</div>
                <a href="/order/create?coffeeId=4" class="btn-order">Order Now</a>
            </div>
        </div>
    </div>
</section>

<section class="about-home">
    <div class="container">
        <div class="about-grid">
            <div>
                <h2>Quality in Every Cup</h2>
                <p>We don't just make coffee, we craft experiences. Every cup is brewed with premium beans and passion.</p>
                <div class="features-list">
                    <span>✅ 100% Arabica Beans</span>
                    <span>✅ Expert Baristas</span>
                    <span>✅ Sustainable Sourcing</span>
                    <span>✅ Consistent Quality</span>
                </div>
            </div>
            <div class="about-cup">☕</div>
        </div>
    </div>
</section>

<section class="process-home">
    <div class="container">
        <h2 class="section-title">From Bean to Cup</h2>
        <p class="section-sub">We care about every single step.</p>
        <div class="process-grid">
            <div class="step">
                <span class="step-num">01</span>
                <span class="step-icon">🌱</span>
                <h5>Select</h5>
                <p>We handpick the finest beans.</p>
            </div>
            <div class="step">
                <span class="step-num">02</span>
                <span class="step-icon">🔥</span>
                <h5>Roast</h5>
                <p>Roasted to perfection.</p>
            </div>
            <div class="step">
                <span class="step-num">03</span>
                <span class="step-icon">☕</span>
                <h5>Brew</h5>
                <p>Expertly brewed.</p>
            </div>
            <div class="step">
                <span class="step-num">04</span>
                <span class="step-icon">❤️</span>
                <h5>Serve</h5>
                <p>Delivered with care.</p>
            </div>
        </div>
    </div>
</section>

</@layout.layout>