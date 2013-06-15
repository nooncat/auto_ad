#encoding: UTF-8
def full_title(page_title)
  base_title = "Ваше авто"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def sign_in(user)
  visit signin_path
  fill_in "Логин", with: user.name
  fill_in "Пароль", with: user.password
  click_button "Войти"
  cookies[:remember_token] = user.remember_token
end
