<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Restaurant Rating!</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container" role="main">
    <div class="page-header">
        <h1>Add Restaurant Review!</h1>
    </div>
    <?php if ($_SERVER["REQUEST_METHOD"] == "POST") { ?>
        <h3 style="color: green">
            Review has been submitted
        </h3>
    <?php } ?>
    <br>
    <form class="col-md-6 form-horizontal" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">

        <div class="form-group">
            <input type="hidden" id="restaurant" name="restaurant" value="<?php echo isset($_GET['restaurant']) ? $_GET['restaurant'] : 1; ?>">
            <div class="form-group">

                <div class="row">
                    <div class="col-md-2">
                        <label for="price_rating">Price:</label>
                    </div>
                    <div class="col-md-6">
                        <select  name="price_rating" id="price_rating" class="col-md-3">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                    <label for="service_rating">Service:</label>
                    </div>

                    <div class="col-md-6">
                        <select  name="service_rating" id="service_rating" class="col-md-3">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">

                <div class="row">

                    <div class="col-md-2">
                        <label for="food_quality_rating">Food Quality:</label>
                    </div>
                    <div class="col-md-6">
                        <select  name="food_quality_rating" id="food_quality_rating" class="col-md-3">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-group">

                <div class="row">

                    <div class="col-md-2">
                        <label for="ambience_rating">Ambience:</label>
                    </div>
                    <div class="col-md-6">
                        <select  name="ambience_rating" id="ambience_rating" class="col-md-3">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </div>
            </div>


            <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                        <label for="overall_experience_rating">Overall Experience:</label>
                    </div>
                    <div class="col-md-6">
                        <select  name="overall_experience_rating" id="overall_experience_rating" class="col-md-3">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-group">

                <label for="name">Comment:</label>

                <textarea id="comment_text" name="comment_text" class="form-control" rows="5"></textarea>
            </div>
        </div>
        <button type="submit" class="btn btn-default">Submit Review</button>
    </form>


</div> <!-- /container -->


</body>
</html>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $host = "localhost";
    $dbname = "restaurant";
    $user = "root";
    $password = "root";

    try {
        $connection = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
        $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $preparedStatement = $connection->prepare("INSERT INTO restaurant.review (em_id, Rest_id, price, Service, Food_quality, Ambience, Overall_experience, Comment) VALUES (:email, :restaurantId, :price_rating, :service_rating, :food_quality_rating, :ambience_rating, :overall_experience_rating, :comment_text);");
        $preparedStatement->bindParam(':email', $_POST['email']);
        $preparedStatement->bindParam(':restaurantId', $_POST['restaurant']);
        $preparedStatement->bindParam(':price_rating', $_POST['price_rating']);
        $preparedStatement->bindParam(':service_rating', $_POST['service_rating']);
        $preparedStatement->bindParam(':food_quality_rating', $_POST['food_quality_rating']);
        $preparedStatement->bindParam(':ambience_rating', $_POST['ambience_rating']);
        $preparedStatement->bindParam(':overall_experience_rating', $_POST['overall_experience_rating']);
        $preparedStatement->bindParam(':comment_text', $_POST['comment_text']);
        $preparedStatement->execute();

    } catch (PDOException $e) {
        echo $e->getMessage();
    }
    $conn = null;
}
?>