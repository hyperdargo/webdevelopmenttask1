
<div class="row">
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-light elevation-1"><i class="fas fa-desktop"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Games Stock</span>
                <span class="info-box-number text-right">
                  <?php 
                    $inv = $conn->query("SELECT sum(quantity) as total FROM inventory ")->fetch_assoc()['total'];
                    $sales = $conn->query("SELECT sum(quantity) as total FROM order_list where order_id in (SELECT order_id FROM sales) ")->fetch_assoc()['total'];
                    echo number_format($inv - $sales);
                  ?>
                  <?php ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-th-list"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Pending Orders</span>
                <span class="info-box-number text-right">
                  <?php 
                    $pending = $conn->query("SELECT sum(id) as total FROM `orders` where status = '0' ")->fetch_assoc()['total'];
                    echo number_format($pending);
                  ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>

          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Sales</span>
                <span class="info-box-number text-right">
                <?php 
                    $sales = $conn->query("SELECT sum(amount) as total FROM `orders` where status = '0' ")->fetch_assoc()['total'];
                    echo number_format($sales);
                  ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
        </div>
<div class="container">
<center><iframe class="col-lg-8 col-md-8 col-sm-12" height="400" src="https://www.youtube.com/embed/<?php echo $_settings->info('yt_video_id') ?>?rel=0&modestbranding=0&autohide=1&mute=1&showinfo=0&controls=0&autoplay=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen allowautoplay></iframe></center>
</div>
