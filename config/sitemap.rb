SitemapGenerator::Sitemap.default_host = "https://www.ebcmap.com"
SitemapGenerator::Sitemap.create do
  add root_path, changefreq: 'daily', priority: 1.0
  add posts_path, changefreq: 'weekly', priority: 0.8
end