Deface::Override.new(
    original: '07c30c283cd22d1e6325883763590f916c2e7104',
    virtual_path: 'spree/layouts/admin',
    name: 'add_blog_posts_to_admin_menu',
    insert_bottom: '[data-hook="admin_tabs"]',
    text: '<ul class="nav nav-sidebar">
        <%= tab t(:blog_posts, scope: \'blogit.posts\'), url: admin_blog_root_path, icon: \'bullhorn\' %>
      </ul>'
)
