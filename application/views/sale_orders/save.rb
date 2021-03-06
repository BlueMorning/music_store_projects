<div>


  <!-- Sale Order Header -->
  <div>
    <h1><%= @form_title %></h1>
  </div>
  <div>
    <div>
      <div>


      </div>
      <!-- CHECKOUT Button -->
      <div>
        <form class="" action="<%= NavSaleOrders.nav_post_checkout_by_id(@sale_order.slo_id) %>" method="post">
            <input type="submit" value="<%= @form_submit_label %>" />
        </form>
      </div>
    </div>
    <div>
        <p>Nb Items :<span><%= @sale_order.nb_items() %></span></p>
        <p>Nb Items :<span>£<%= @sale_order.slo_total_price %></span></p>
    </div>
  </div>


  <!-- Seraching bar -->
  <div>
    <form class="" action="<%= @form_search_action %>" method="get">
        <input type="text" value="<%= @album_search %>" name="album_search" placeholder="Title album or Artist's name" />
        <input type="submit" value="GO !" />
    </form>
  </div>

  <!-- List of items -->
  <form class="" action="<%= NavSaleOrders.nav_post_add_items(@sale_order.slo_id) %>" method="post">

    <div>
      <select class="" name="slo_cus_id" id="slo_cus_id" required>
          <option value="">Customers</option>
          <% @customers.each do |customer| %>
            <option value="<%= customer.cus_id %>"
              <% if(@sale_order.slo_cus_id == customer.cus_id)%>
                selected
              <% end %>
            >
              <%= customer.cus_name.capitalize() %>
          </option>
          <% end %>
      </select>

    </div>


    <div>

      <table>
        <thead>
          <th>Cover</th>
          <th>Album</th>
          <th>Artist</th>
          <th>Genre</th>
          <th>Unit Price</th>
          <th>Quantity</th>
        </thead>
        <tbody>
          <% @sale_order.sale_items.each do |sale_item|  %>
            <tr>
              <td><img class="album_img" src="<%= sale_item.album.alb_image_path %>" alt="<%= sale_item.album.alb_title %>"></td>
              <td><%= sale_item.album.alb_title  %></td>
              <td><%= sale_item.artist.art_name %></td>
              <td><%= sale_item.genre.gen_name  %></td>
              <td><%= sale_item.album.alb_price %></td>
              <td>
                <input type="number" step="1" min="0"
                 name="<%= "qty_alb_id_#{sale_item.album.alb_id}" %>"
                 value="<%= sale_item.sli_qty %>"
                 max="<%= sale_item.album.alb_qty_available %>" required/>
              </td>
              <td><%= "Max.: #{sale_item.album.alb_qty_available}" %></td>
            </tr>
          <% end %>
        </tbody>
      </table>
    </div>


    <div>
      <table>
        <thead>
          <th>Cover</th>
          <th>Album</th>
          <th>Artist</th>
          <th>Genre</th>
          <th>Unit Price</th>
          <th>Quantity</th>
        </thead>
        <tbody>
          <% @sale_order.sale_items_not_added.each do |sale_item|  %>
            <tr>
              <td><image class="album_img" src="<%= sale_item.album.alb_image_path %>" alt="<%= sale_item.album.alb_title %>"></td>
              <td><%= sale_item.album.alb_title  %></td>
              <td><%= sale_item.artist.art_name %></td>
              <td><%= sale_item.genre.gen_name  %></td>
              <td><%= sale_item.album.alb_price %></td>
              <td>
                <input type="number" step="1" min="0"
                 name="<%= "qty_alb_id_#{sale_item.album.alb_id}" %>"
                 value="<%= sale_item.sli_qty %>"
                 max="<%= (sale_item.album.alb_qty_available) %>" required/>
              </td>
              <td><%= "Max.: #{sale_item.album.alb_qty_available}" %></td>
            </tr>
          <% end %>
        </tbody>
      </table>
    </div>

    </div>
    <!-- ADD button -->
    <div>
      <input type="submit" value="Add items to the cart" />
    </div>
  </form>
</div>
