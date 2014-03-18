<% if user_signed_in? %>
             Logged in as <strong><%= current_user.email %></strong>.
          <% else %>
            <%= link_to "Sign in", new_user_session_path, :class => 'btn btn-default'  %>
<% end %>