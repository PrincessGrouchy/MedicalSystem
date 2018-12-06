<?php
    include_once "dataBase_connect.php";
    $result = mysqli_query($link, "SELECT * FROM appointment");
    
    $row = mysqli_fetch_array($result);
    mysqli_close($link);
?>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="./css/AppDiplay.css">
</head>
<body>
	<header class="header-banner">
		<div class="container-width">
			<div class="logo-container">
				<div class="logo">471 Medical Project</div>
			</div>
			<nav class="menu"></nav>
			<div class="clearfix"></div>
			<div id="i7klvm" class="lead-title">All upcoming appointments</div>
			<div id="irxhtb">Your upcoming appointments</div>
			<div id="it3pb3" class="row">
				<div id="idnvug" class="cell">
					<div id="ixi7zw" class="row">
						<div id="ihr3hi" class="cell">
							<div id="i40f1j">Confirmation Number</div>
							<div id="ih4qsk"></div>
							<span id="iwjorcl"><?php echo $row['App_ConfirmationNum']; ?></span>
						</div>
						<div></div>
						<div id="i1gd7u" class="cell">
							<div id="imjtui">Your Name</div>
							<div id="i2jaql">
								<span id="i7vkafk"><?php echo $row['App_Patient_SIN']; ?></span>
							</div>
						</div>
						<div id="ihhl3g" class="cell">
							<div id="i81z15">Your Doctor's Name</div>
							<div id="inoj8b">
								<span><?php echo $row['App_MedStaff_SIN']; ?></span>
							</div>
						</div>
						<div class="cell">
							<div id="idh0tj">Institution's Name</div>
							<div>
								<span><?php echo $row['App_Inst_Name']; ?></span>
							</div>
						</div>
						<div class="cell">
							<div id="iy5scz">Reason for Appointment</div>
							<div>
								<span><?php echo $row['App_appointmentType']; ?></span>
							</div>
						</div>
						<div id="iiuqhh" class="cell">
							<div id="iin38l">Date</div>
							<div>
								<span><?php echo $row['App_Date']; ?></span>
							</div>
						</div>
						<div class="cell">
							<div id="ijpvsl">Start Time</div>
							<div>
								<span><?php echo $row['App_Start_time']; ?></span>
							</div>
						</div>
						<div class="cell">
							<div id="in60sh">End Time</div>
							<div>
								<span><?php echo $row['App_End_time']; ?></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
</body>
</html>