require 'rails_helper' # what does this line do?

describe 'navigate' do
  before do
    @post = Post.create(title: 'My Post', description: 'My post desc')
  end

  it 'loads the new page' do
    visit "/posts/#{@post.id}"
    expect(page.status_code). to eq(200)
  end

  it 'shows the title and the show page in an h1 tag' do
    visit "posts/#{@post.id}"
    expect(page).to have_css('h1', text: 'My Post')
  end

  it 'shows the description on the show page in a p tag' do
    visit "posts/#{@post.id}"
    expect(page).to have_css('p', text: 'My post desc')
  end
end