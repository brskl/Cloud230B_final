// InsertImages.js


// upload file and set permissions
aws s3 cp 47d39e0d-575e-4488-9b66-9100bd50dd63.jpg s3://brsklar-celebrity-images
aws s3api put-object-acl --acl public-read --bucket brsklar-celebrity-images --key 47d39e0d-575e-4488-9b66-9100bd50dd63.jpg

// aws cli scripts to upload data into table: CelebrityImageFiles



// Neve Campbell
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "7cbfa86e-16c1-4744-a27c-57046ab9371a.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "513"}, "Width": {"N": "342"}, "Source": {"S": "http://image.tmdb.org/t/p/w342/8FQFKQSvrlm752DJKPtX5HBONre.jpg"}}'
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "da6f5cb8-eb68-463f-8cb0-ca44d510f53d.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "1662"}, "Width": {"N": "1280"}, "Source": {"S": "http://celebmafia.com/wp-content/uploads/2016/09/neve-campbell-emmy-awards-in-los-angeles-09-18-2016-3.jpg"}}'

// Jennifer Love Hewitt
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "4c5c0346-4145-4d92-bcce-c54c7e271293.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "1080"}, "Width": {"N": "1920"}, "Source": {"S": "http://wallpapersqq.net/wp-content/uploads/2016/03/jennifer-love-hewitt-image-hd-2016.jpg"}}'
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "8b0221a0-34e0-4cee-8d22-76aad535e3b2.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "1110"}, "Width": {"N": "740"}, "Source": {"S": "http://iv1.lisimg.com/image/3760781/740full-jennifer-love-hewitt.jpg"}}'
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "47d39e0d-575e-4488-9b66-9100bd50dd63.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "600"}, "Width": {"N": "380"}, "Source": {"S": "https://s-media-cache-ak0.pinimg.com/736x/85/37/14/8537148d786aa3f832ec3791db472efd.jpg"}}'

// Matthew Fox
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "ccafe8e1-d7ce-4190-81a2-87960ba253c6.png"}, "Extension": {"S": "PNG"}, "Height": {"N": "493"}, "Width": {"N": "417"}, "Source": {"S": "http://gazettereview.com/wp-content/uploads/2015/06/matthew-fox-young.png"}}'

// Party of Five (Matthew Fox, Neve Campbell, Jennifer Love Hewitt, Lacey Chabert, Scott Wolf)
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "6d30c302-790d-4b0d-9af1-213a22ccd421.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "834"}, "Width": {"N": "1024"}, "Source": {"S": "http://media.cmgdigital.com/shared/img/photos/2012/08/13/92/2d/slideshow_1002203033_PARTY-OF-FIVE6_62890.jpg"}}'
