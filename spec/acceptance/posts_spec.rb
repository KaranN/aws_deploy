require 'acceptance_helper'

resource "Posts" do
  let(:post) { FactoryGirl.create(:post) }
  
  get "/api/v1/posts" do
    example "Listing posts" do
      do_request

      expect(status).to be(200)
    end
  end

  get "/api/v1/posts/:id" do
    parameter :id, "post id to view", required: true
    response_field :post, 'post data'

    let(:id) { post.id }
    
    example "View single posts" do
      do_request

      expect(status).to be(200)
      json = JSON.parse(response_body)['post']
      expect(json['body']).to eq("Test Post Body")
      expect(json['title']).to eq("Test Post")
    end
  end
end