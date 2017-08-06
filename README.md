# short prefix
일반적으로 resources로 route로 만들면 get method에 대응되는 prefix가 만들어집니다.<br>
그래서 scaffold를 사용할 때는 그런 prefix를 사용해서 쉽게 사용할 수 있습니다.<br>
그런데 resources안에 resources를 집어넣는다면 안에 있는 resources의 prefix의 형태는 beforeResource_afterResource 이러한 형태로 만들어집니다.<br>
이래서 그 안에 요소는 scaffold형태로 작업을 하려면 모든 링크들의 path를 다 고쳐주어야 합니다.<br>
이걸 방지할 수 있는 방안을 생각해봤습니다.<br>

## basic
* 콘솔 세팅
```console
rails g scaffold post title content:text
rails g scaffold innerpost title content:text post:references
rake db:migrate
```
* route 설정
```ruby
resources :posts do 
    resources :innerposts
end
```
* rake routes
```console
             root GET    /                                             posts#index
    post_innerposts GET    /posts/:post_id/innerposts(.:format)          innerposts#index
                    POST   /posts/:post_id/innerposts(.:format)          innerposts#create
 new_post_innerpost GET    /posts/:post_id/innerposts/new(.:format)      innerposts#new
edit_post_innerpost GET    /posts/:post_id/innerposts/:id/edit(.:format) innerposts#edit
     post_innerpost GET    /posts/:post_id/innerposts/:id(.:format)      innerposts#show
                    PATCH  /posts/:post_id/innerposts/:id(.:format)      innerposts#update
                    PUT    /posts/:post_id/innerposts/:id(.:format)      innerposts#update
                    DELETE /posts/:post_id/innerposts/:id(.:format)      innerposts#destroy
              posts GET    /posts(.:format)                              posts#index
                    POST   /posts(.:format)                              posts#create
           new_post GET    /posts/new(.:format)                          posts#new
          edit_post GET    /posts/:id/edit(.:format)                     posts#edit
               post GET    /posts/:id(.:format)                          posts#show
                    PATCH  /posts/:id(.:format)                          posts#update
                    PUT    /posts/:id(.:format)                          posts#update
                    DELETE /posts/:id(.:format)                          posts#destroy
```
## custom
* route
```ruby
scope :path => '/posts/:post_id' do
  resources :innerpost
end
```
* rake routes
```console
 POST   /posts(.:format)                              posts#create
           new_post GET    /posts/new(.:format)                          posts#new
          edit_post GET    /posts/:id/edit(.:format)                     posts#edit
               post GET    /posts/:id(.:format)                          posts#show
                    PATCH  /posts/:id(.:format)                          posts#update
                    PUT    /posts/:id(.:format)                          posts#update
                    DELETE /posts/:id(.:format)                          posts#destroy
    innerpost_index GET    /posts/:post_id/innerpost(.:format)           innerpost#index
                    POST   /posts/:post_id/innerpost(.:format)           innerpost#create
      new_innerpost GET    /posts/:post_id/innerpost/new(.:format)       innerpost#new
     edit_innerpost GET    /posts/:post_id/innerpost/:id/edit(.:format)  innerpost#edit
          innerpost GET    /posts/:post_id/innerpost/:id(.:format)       innerpost#show
                    PATCH  /posts/:post_id/innerpost/:id(.:format)       innerpost#update
                    PUT    /posts/:post_id/innerpost/:id(.:format)       innerpost#update
                    DELETE /posts/:post_id/innerpost/:id(.:format)       innerpost#destroy
```