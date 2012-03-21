A micro library for mocking up APIs with Sinatra, allowing you to do
things like this:

      require 'sinatra'
      require 'faker'
      require 'mocki'

      get '/users' do
        mocki do
          {
            status: :ok,
            results: 2.records {|id| {
              id: id,
              name: Faker::Name.name,
              email: Faker::Internet.email,
              comments: 2.records {{
                title: Faker::Lorem.words.map(&:capitalize).join(" "),
                body: Faker::Lorem.paragraph
              }}
            }}
          }
        end
      end

      post '/users' do
        mocki do
          {
            status: :created,
            first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email],
          }
        end
      end

Which, combined with the awesomeness that is Sinatra, allows you to make
an HTTP request to /users and get this:

      {
        status: "ok",
        results: [
          id: 1,
          name: "Aaron Becker Sr.",
          email: "aleandro_halvorson@kling.net",
          comments: [
            {
              title: "Iste Ratione Dolorum",
              body: "Deserunt porro ab qui doloremque est ea sint. Amet tempora officiis. Porro atque quo libero ipsa voluptas doloremque possimus. Sunt dolore et amet aperiam. Sit aut voluptatem sunt ipsum non odio iste."
            },
            {
              title: "Enim Et Aut",
              body: "Dolorum a est quae nisi qui placeat. Non iusto ut dignissimos accusantium at aut est. Alias illum repellat qui pariatur. Dolorem reiciendis eaque impedit illum corrupti enim."
              }
            ]
          },
          {
            id: 2,
            name: "Leta Volkman",
            email: "jerrell_luettgen@balistreri.org",
            comments: [
              {
                title: "Deleniti Ut Quia",
                body: "Assumenda rem impedit. Accusantium in esse voluptas harum nisi doloribus nihil. Esse animi occaecati quibusdam atque vel autem laboriosam. Eos rerum est sit. Autem voluptatum reprehenderit inventore esse quidem voluptatem."
              },
              {
                title: "Sunt Quidem Nam",
                body: "In temporibus iure. Sapiente fuga ipsum praesentium illum dolor consequuntur est. Nemo ab sit exercitationem et ex delectus. Placeat voluptatum voluptas maiores temporibus. Hic ipsam error est qui illum."
              }
            ]
          }
        ]
      }

To install:

    gem install mocki
