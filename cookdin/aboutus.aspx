<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="aboutus.aspx.cs" Inherits="aboutus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <main role="main" class="main main-padding">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a title="Home" href="#">Home</a></li>
					<li>About Us</li>
				</ul>
			</nav>
			<!--//breadcrumbs-->
        <section class="content">
			<!--row-->
			<div class="row">
				<header class="s-title" style="">
					<h1>About Us</h1>
				</header>
        <div class="full-width" style="">
			<div class="container box">
				<h2>About Cook'dIn</h2>
				<p>The trio of Hemal (Desai), Abhijeet (Goswami) & Harsh (Vardhan), have been friends, for over a decade. Passionate foodies & weekend chefs, each brings a little unique flavor; to the palate called, Cook’dIn. Necessity as they say is the mother of invention and each of the three, during their ‘away from home, meal experience’, had faced issues every expat, student, bachelor/bachelorette and a frequent flier faces. </p>
                <p>Cook’dIn was born during a reminiscing session after a sumptuous Home Cooked meal.</p>
                <p>Cook’dIn was conceived as a catalyst & facilitator that would empower people. Cook’dIn creates a primary/secondary revenue stream for homemakers and low to median income groups, by catering to the need of consumers for home-cooked food. It is a convergence platform which aspires to be a worldwide phenomenon, truly empowering individual/s on, what they cook/ eat, when they cook/eat, where they cook/eat and the reducing cost of what they cook/eat.</p>
                <p>Cook’dIn addresses -
                    <ul class="my-list">
                        <li><strong>Consumers do not have the meal option</strong>, which they’re used to or like to have.</li>
                        <li><strong>Encourage talented amateur cooks</strong>, who do not have the resources, to exploit their talent..</li>
                        <li><strong>ealthy, Hygienic & Allergy sensitive food</strong> at a pocket friendly price, delivered at the home step.</li>
                        <li><strong>Authentic cuisine is rarely available.</strong>What is available in lieu is ‘altered to suit taste of the masses’.</li>
                        <li><strong>Preserve many regional and archetypical recipes</strong>, which are vanishing and/or unknown to a larger number of foodies.</li>
                    </ul>
                </p>
                <div class="col-lg-12">
                <section class="team-profile col-lg-3">
                    <asp:Image ID="imgHemal" ImageUrl="~/images/hemal-desai.jpg" runat="server" Width="225"></asp:Image>
                    <h4>HEMAL DESAI</h4>
                    <span>(Co-Founder & Resident Geek. Gourmet Chef) - Technical & IT.</span>
                </section>
                <section class="team-profile col-lg-3">
                    <asp:Image ID="imgAbhijeet" ImageUrl="~/images/abhijeet-goswami.jpg" runat="server" Width="225"></asp:Image>
                    <h4>ABHIJEET GOSWAMI</h4>
                    <span>(Co-Founder & Chief Story Teller. Summa cum laude, Food Critique) - Legal, Sales & Advertising.</span>
                </section>
                <section class="team-profile col-lg-3">
                <section class="team-profile ">
                    <asp:Image ID="imgHarsh" ImageUrl="~/images/harsh-vardhan.jpg" runat="server" Width="225"></asp:Image>
                    <h4>HARSH VARDHAN </h4>
                    <span>(Co-Founder & Chief Number Cruncher. Alpha, Back Room Boy) – Ops., Market Research & Financial.</span>
                </section>
                </div>
			</div>
		</div>
        </section>
        </div>
        </main>
</asp:Content>

