<!DOCTYPE html>
<!--[if !IE]><!-->
<html lang="rus">
<!--<![endif]-->
	<head>
		<? include "loc.php"?>
		<meta charset="utf-8">
		<title>GlobalTech</title>
		<meta name="description" content="страница монтажной компании Globaltech">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="../images/favicon.ico">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700,300&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300' rel='stylesheet' type='text/css'>
		<link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
		<link href="../fonts/font-awesome/css/font-awesome.css" rel="stylesheet">
		<link href="../css/animations.css" rel="stylesheet">
		<link href="../css/style.css" rel="stylesheet">
		<link href="../css/custom.css" rel="stylesheet">
	</head>	
	<body class="no-trans">
		<header class="codrops-header">
				<section>
					<select class="cs-select cs-skin-circular">
						<option value="" disabled selected>Выберите элемент</option>
						<option value="banner">#banner</option>
						<option value="about">#about</option>
						<option value="services">#services</option>
						<option value="portfolio">#portfolio</option>
						<option value="clients">#clients</option>
						<option value="contact">#contact</option>
					</select>
				</section>	
				<section>
					<select class="cs-select cs-skin-circular cs-skin-circular-left">
						<option value="RU">/worth/ru-ru/</option>
						<option value="DE">/worth/de-de/</option>
						<option value="IT">/worth/it-it/</option>
						<option value="EN">/worth/en-us/</option>
					</select>							
				</section>
					<!--div class="main-navigation animated">				
						<nav class="navbar navbar-default" role="navigation">
							<div class="container-fluid">
								<div class="navbar-collapse scrollspy smooth-scroll" id="navbar-collapse-1">
									<ul class="nav navbar-nav navbar-right">
										<li class="active"><a href="#banner"><?php echo $home;?></a></li>
										<li><a href="#about"><?php echo $company;?></a></li>
										<li><a href="#services"><?php echo $services;?></a></li>
										<li><a href="#portfolio"><?php echo $portfolio;?></a></li>
										<li><a href="#clients"><?php echo $reviews;?></a></li>
										<li><a href="#contact"><?php echo $contacts;?></a></li>
									</ul>
								</div>									
							</div>
						</nav>
					</div-->
					
			
		</header>

		<div id="banner" class="banner">
			<div class="banner-image"></div>
			<div class="banner-caption">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 object-non-visible" data-animation-effect="fadeIn">
							<h1 class="text-center"><?php echo $company_hello;?></h1>
							<p class="lead text-center"><?php echo $main_text;?></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section clearfix object-non-visible" data-animation-effect="fadeIn">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 id="about" class="title text-center"><?php echo $company_header;?></h1>
						<p class="lead text-center"><?php echo $logo_descr;?></p>
						<div class="space"></div>
						<div class="row">
							<div class="col-md-6">
								<img src="../images/Glob.png" alt="">
								<div class="space"></div>
							</div>
							<div class="col-md-6">
								<?php echo $company_text;?>
							</div>
						</div>
						<div class="space">
						<h2 class="title text-center"> <?php echo $costumers?></h2>
						</div>
						<div class="row">
							<div class="row team">
				<div class="col-md-4 b1">
						<img class="img-responsive" src="../images/picTeam/004.jpg">
						<?php echo $costumer0?>
						
				</div>
				<div class="col-md-4 b1">
						<img class="img-responsive" src="../images/picTeam/003.jpg">
						<?php echo $costumer4?>
						
				</div>
				<div class="col-md-4 b1">
						<img class="img-responsive" src="../images/picTeam/008.jpg">
						<?php echo $costumer1?>
						
				</div>
					</div>
						<div class="row team">
				<div class="col-md-4">
						<img class="img-responsive" src="../images/picTeam/006.jpg">
						<?php echo $costumer2?>
				</div>
		
				<div class="col-md-4 b3">
						<img class="img-responsive" src="../images/picTeam/picT3.png">
						<?php echo $costumer3?>
				</div>
				<div class="col-md-4 b3">
						<img class="img-responsive" src="../images/picTeam/003.jpg">
						<?php echo $costumer5?>
				</div></div>
			</div>
			</div>
			</div>
			</div>
			</div>
		</div>
		<div class="section translucent-bg bg-image-1 orange">
			<div class="container object-non-visible" data-animation-effect="fadeIn">
				<h1 id="services" class="text-center title"><?php echo $our_services;?></h1>
				<div class="space"></div>
				<div class="row">
					<div class="col-sm-6">
						<div class="media">
							<div class="media-body text-right">
								<h4 class="media-heading">
								<?php echo $service1;?>
								</h4>
								<p><?php echo $service1_descr;?></p>
							</div>
							<div class="media-right">
								<i class="fa fa-pencil-square-o"></i>
							</div>
						</div>
						<div class="media">
							<div class="media-body text-right">
								<h4 class="media-heading">
								<?php echo $service2;?>
								</h4>
								<p><?php echo $service2_descr;?></p>
							</div>
							<div class="media-right">
								<i class="fa fa-gavel"></i>
							</div>
						</div>
						
						<div class="media">
							<div class="media-body text-right">
								<h4 class="media-heading">
								<?php echo $service3;?>
								</h4>
								<p><?php echo $service3_descr;?></p>
							</div>
							<div class="media-right">
								<i class="fa fa-wrench"></i>
							</div>
						</div>
						</div>
					<div class="space visible-xs"></div>
					<div class="col-sm-6">
						<div class="media">
							<div class="media-left">
								<i class="fa fa-users"></i>
							</div>
							<div class="media-body text-left">
								<h4 class="media-heading">
								<?php echo $service4;?>
								</h4>
								<p><?php echo $service4_descr;?></p>
							</div>
							
						</div>
					
						<div class="media">
							<div class="media-left">
								<i class="fa fa-cubes"></i>
							</div>
							<div class="media-body">
								<h4 class="media-heading">
								<?php echo $service5;?>
								</h4>
								<p><?php echo $service5_descr;?></p>
							</div>
						</div>
						<div class="media">
							<div class="media-left">
								<i class="fa fa-truck"></i>
							</div>
							<div class="media-body">
								<h4 class="media-heading">
								<?php echo $service6;?>
								</h4>
								<p><?php echo $service6_descr;?></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="default-bg space orange">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
					<h1 class="text-center"><?php echo $scream;?></h1>	
					</div>
				</div>
			</div>
		</div>
		<div class="section">
			<div class="container">
				<h1 class="text-center title" id="portfolio"><?php echo $portfolio;?></h1>
				<div class="separator"></div>
				<p class="lead text-center"><?php echo $portfolio_about;?></p>
				<br>			
				<div class="row object-non-visible" data-animation-effect="fadeIn">
					<div class="col-md-12">					
						<div class="filters text-center">
							<ul class="nav nav-pills">
								<li class="active"><a href="#" data-filter="*"><?php echo $category_all?></a></li>
								<li><a href="#" data-filter=".web-design"><?php echo $category1?></a></li>	
								<li><a href="#" data-filter=".app-development"><?php echo $category2?></a></li>	
								<li><a href="#" data-filter=".site-building"><?php echo $category3?></a></li>	
							</ul>
						</div>					
						<div class="isotope-container row grid-space-20">
							<?php foreach ($projects as $project)
							{?>
							<div class="col-sm-6 col-md-3 isotope-item <?php echo $project[type];?>">
								<div class="image-box">
									<div class="overlay-container">
										<img src="<?php echo $project[image]?>" alt="">
										<a class="overlay" data-toggle="modal" data-target="<?php echo $project[number];?>">
											<i class="fa fa-search-plus"></i>
											<span> <?php echo $project[type];?> </span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#<?php echo $project[number];?>"><?php echo $project[title];?></a>
								</div>
								<div class="modal fade" id="<?php echo $project[title];?>" tabindex="-1" role="dialog" aria-labelledby="<?php echo $project[title];?>-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"><?php echo $close;?></span></button>
												<h4 class="modal-title" id="<?php echo $project[number];?>-label"><?php echo $project[title];?> </h4>
											</div>
											<div class="modal-body">
												<h3><?php echo $project_descr;?></h3>
												<div class="row">
													<div class="col-md-6">
														<?php echo $project[description];?>
													</div>
													<div class="col-md-6">
														<img src="<?php echo $project[image];?>" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal"><?php echo $close;?></button>
											</div>
										</div>
									</div>
								</div>
							</div>	
							<?php }?>							
					</div>
				</div>
			</div>
		</div>
		<div class="section translucent-bg bg-image-2 pb-clear">
			<div class="container object-non-visible" data-animation-effect="fadeIn">
				<h1 id="clients" class="title text-center"> <?php echo $rewiew;?> </h1>
				<div class="space"></div>
				<?php 
				$i=0;
				foreach ($rewiews as $rewiew) { 
				if ($i%3==0) echo "<div class=\"row\">";
				$i++; ?>
					<div class="col-md-4">
						<div class="media testimonial">
							<div class="media-left">
								<img src="<?php echo $rewiew[image];?>" alt="">
							</div>
							<div class="media-body">
								<h3 class="media-heading"> <?php echo $rewiew[title];?> </h3>
								<blockquote>
									<p><?php echo $rewiew[description];?></p>
									<footer><?php echo $rewiew[sourse];?></footer>
								</blockquote>
							</div>
						</div>
					</div>
				<?php if ($i%3==0) echo "</div>"; }?>
			</div>
			<!-- section start -->
			<!-- ================ -->
			<div class="translucent-bg orange">
				<div class="container">
					<div class="list-horizontal">
						<div class="row">
							<div class="col-xs-2">
								<div class="list-horizontal-item">
									<img src="../images/client-1.png" alt="client">
								</div>
							</div>
							<div class="col-xs-2">
								<div class="list-horizontal-item">
									<img src="../images/client-2.png" alt="client">
								</div>
							</div>
							<div class="col-xs-2">
								<div class="list-horizontal-item">
									<img src="../images/client-3.png" alt="client">
								</div>
							</div>
							<div class="col-xs-2">
								<div class="list-horizontal-item">
									<img src="../images/client-4.png" alt="client">
								</div>
							</div>
							<div class="col-xs-2">
								<div class="list-horizontal-item">
									<img src="../images/client-5.png" alt="client">
								</div>
							</div>
							<div class="col-xs-2">
								<div class="list-horizontal-item">
									<img src="../images/client-6.png" alt="client">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="default-bg space">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h1 class="text-center"><?php echo $motivate;?></h1>
					</div>
				</div>
			</div>
		</div>
		</div>
		<footer id="footer">
			<div class="footer section">
				<div class="container">
					<h1 class="title text-center" id="contact"> <?php echo $w880;?></h1>
					<div class="space"></div>
					<div class="row">
						<div class="col-sm-6">
							<div class="footer-content">
								<p class="large"><?php echo $contact_description;?></p>
								<ul class="list-icons">
									<li><i class="fa fa-map-marker pr-10"></i> <?php echo $contact_adress;?> </li>
									<li><i class="fa fa-phone pr-10"></i> <?php echo $contact_phone;?></li>
									<li><i class="fa fa-envelope-o pr-10"></i> <?php echo $contact_mail;?></li>
								</ul>
								<ul class="social-links">
								<li class="facebook"><a target="_blank" href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
								<li class="twitter"><a target="_blank" href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>
								<li class="googleplus"><a target="_blank" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
								<li class="skype"><a target="_blank" href="http://www.skype.com"><i class="fa fa-skype"></i></a></li>
								<li class="linkedin"><a target="_blank" href="http://www.linkedin.com"><i class="fa fa-linkedin"></i></a></li>
								<li class="youtube"><a target="_blank" href="http://www.youtube.com"><i class="fa fa-youtube"></i></a></li>
								<li class="flickr"><a target="_blank" href="http://www.flickr.com"><i class="fa fa-flickr"></i></a></li>
								<li class="pinterest"><a target="_blank" href="http://www.pinterest.com"><i class="fa fa-pinterest"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="footer-content">
								<form role="form" id="footer-form">
									<div class="form-group has-feedback">
										<label class="sr-only" for="name2"><?php echo $name;?></label>
										<input type="text" class="form-control" id="name2" placeholder="<?php echo $name_descr;?>" name="name2" required>
										<i class="fa fa-user form-control-feedback"></i>
									</div>
									<div class="form-group has-feedback">
										<label class="sr-only" for="email2<?php echo $e_mail;?>label>
										<input type="email" class="form-control" id="email2" placeholder="<?php echo $e_mail_descr;?>"  name="email2" required>
										<i class="fa fa-envelope form-control-feedback"></i>
									</div>
									<div class="form-group has-feedback">
										<label class="sr-only" for="phone2"><?php echo $phone;?></label>
										<input type="phone" class="form-control" id="phone2" placeholder="<?php echo $phone_descr;?>" name="phone2" required>
										<i class="fa fa-phone form-control-feedback"></i>
									</div>
									<div class="form-group has-feedback">
										<label class="sr-only" for="message2"><?php echo $message;?></label>
										<textarea class="form-control" rows="8" id="message2" placeholder="<?php echo $name_descr;?>" name="message2" required></textarea>
										<i class="fa fa-pencil form-control-feedback"></i>
									</div>
									<input type="submit" value="<?php echo $send;?>" class="btn btn-default">
								</form>
							</div>
						</div>
					</div>
					<div class="map">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2003.8002161777222!2d30.28482200000001!3d59.85245800000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46963ac1b3d44397%3A0x8d3e6c2b972c2e2!2z0JvQtdC90LjQvdGB0LrQuNC5INC_0YAuLCAxNDAsINCh0LDQvdC60YIt0J_QtdGC0LXRgNCx0YPRgNCzLCAxOTgyMTY!5e0!3m2!1sru!2sru!4v1433450811051" width="100%" height="550" frameborder="0" style="border:0"></iframe>
				</div>
				</div>
				
			</div>
			<div class="subfooter">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
										<p class="text-center">Copyright © 2015 GlobalTech</p>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<script type="text/javascript" src="../plugins/jquery.min.js"></script>
		<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>	
		<script type="text/javascript" src="../plugins/modernizr.js"></script>			
		<script type="text/javascript" src="../plugins/isotope/isotope.pkgd.min.js"></script><script type="text/javascript" src="../plugins/jquery.backstretch.min.js"></script>		
		<script type="text/javascript" src="../plugins/jquery.appear.js"></script>	
		<script type="text/javascript" src="../js/template.js"></script>
		<script type="text/javascript" src="../js/custom.js"></script>	
		<script type="text/javascript" src="../js/classie.js"></script>
		<script type="text/javascript" src="../js/selectFx.js"></script>
		<script>
			(function() {
				[].slice.call( document.querySelectorAll( 'select.cs-select' ) ).forEach( function(el) {	
					new SelectFx(el, {
						stickyPlaceholder: false,
						onChange: function(val){
							var img = document.createElement('img');
							img.src = '../images/'+val+'.png';
							img.onload = function() {
								document.querySelector('span.cs-placeholder').style.backgroundImage = 'url(../images/'+val+'.png)';
							};
						}
					});
				} );
			})();
		</script>
	</body>
</html>
