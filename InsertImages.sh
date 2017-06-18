// InsertImages.js


// upload file and set permissions
aws s3 cp 580ab9fa-4155-41f1-b81a-3688e452e04c.jpg s3://brsklar-celebrity-images
aws s3api put-object-acl --acl public-read --bucket brsklar-celebrity-images --key 580ab9fa-4155-41f1-b81a-3688e452e04c.jpg


// aws cli scripts to upload data into table: CelebrityImageFiles

// Neve Campbell
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "7cbfa86e-16c1-4744-a27c-57046ab9371a.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "513"}, "Width": {"N": "342"}, "Source": {"S": "http://image.tmdb.org/t/p/w342/8FQFKQSvrlm752DJKPtX5HBONre.jpg"}}'
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "da6f5cb8-eb68-463f-8cb0-ca44d510f53d.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "1662"}, "Width": {"N": "1280"}, "Source": {"S": "http://celebmafia.com/wp-content/uploads/2016/09/neve-campbell-emmy-awards-in-los-angeles-09-18-2016-3.jpg"}}'

// Jennifer Love Hewitt
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "4c5c0346-4145-4d92-bcce-c54c7e271293.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "1080"}, "Width": {"N": "1920"}, "Source": {"S": "http://wallpapersqq.net/wp-content/uploads/2016/03/jennifer-love-hewitt-image-hd-2016.jpg"}}'
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "8b0221a0-34e0-4cee-8d22-76aad535e3b2.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "1110"}, "Width": {"N": "740"}, "Source": {"S": "http://iv1.lisimg.com/image/3760781/740full-jennifer-love-hewitt.jpg"}}'
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "47d39e0d-575e-4488-9b66-9100bd50dd63.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "600"}, "Width": {"N": "380"}, "Source": {"S": "https://s-media-cache-ak0.pinimg.com/736x/85/37/14/8537148d786aa3f832ec3791db472efd.jpg"}}'
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "49beab04-d4fc-41ec-bbdd-25e1be886d64.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "1024"}, "Width": {"N": "713"}, "Source": {"S": "http://media.gettyimages.com/photos/actress-jennifer-love-hewitt-attends-the-party-of-five-cast-meet-on-picture-id453736603"}}'

// Matthew Fox
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "ccafe8e1-d7ce-4190-81a2-87960ba253c6.png"}, "Extension": {"S": "PNG"}, "Height": {"N": "493"}, "Width": {"N": "417"}, "Source": {"S": "http://gazettereview.com/wp-content/uploads/2015/06/matthew-fox-young.png"}}'

// Lacey chabert
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "2f6475db-9309-4452-91b0-478be06c6a21.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "1933"}, "Width": {"N": "1280"}, "Source": {"S": "http://celebmafia.com/wp-content/uploads/2016/04/lacey-chabert-2016-milk-bookies-story-time-celebration-at-california-market-center-in-los-angeles-1.jpg"}}'
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "4e4eea45-be58-43d1-a574-b7c34709cb93.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "1600"}, "Width": {"N": "1200"}, "Source": {"S": "http://famousqts.com/imagehost/uploads/lacey_chabert-4183.jpg"}}'

// Party of Five (Matthew Fox, Neve Campbell, Jennifer Love Hewitt, Lacey Chabert, Scott Wolf)
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "6d30c302-790d-4b0d-9af1-213a22ccd421.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "834"}, "Width": {"N": "1024"}, "Source": {"S": "http://media.cmgdigital.com/shared/img/photos/2012/08/13/92/2d/slideshow_1002203033_PARTY-OF-FIVE6_62890.jpg"}}'

// Bill Clinton
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "2f34f9d1-5142-400a-9f9c-a90580b80059.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "3000"}, "Width": {"N": "2053"}, "Source": {"S": "http://images.closerweekly.com/uploads/posts/image/52886/bill-clinton.jpg"}}
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "d8f3ff79-9c94-4edf-89e0-9a38da7850c1.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "933"}, "Width": {"N": "948"}, "Source": {"S": "http://thefederalist.com/wp-content/uploads/2015/03/Bill-Clinton-Photo.jpg"}}

// Barack Obama
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "e8851dfd-9c7c-4f06-9570-75acb81e77ea.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "769"}, "Width": {"N": "615"}, "Source": {"S": "http://usinfonews.com/wp-content/uploads/2017/02/Barack-Obama.jpg"}}
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "580ab9fa-4155-41f1-b81a-3688e452e04c.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "400"}, "Width": {"N": "650"}, "Source": {"S": "http://i.ndtvimg.com/i/2015-12/barack-obama-afp_650x400_61450947679.jpg"}}

// Bill Clinton and Barack Obama
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "9107f8fc-3b58-461d-8d21-85c972c9e225.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "780"}, "Width": {"N": "1200"}, "Source": {"S": "https://wittymisfitsinc.files.wordpress.com/2014/11/former-pres-bill-clinton-and-president-obama.jpg"}}

// Melissa Rauch
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "ad6a9f3a-d3a1-4d07-b8aa-cc05087e94a2.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "1585"}, "Width": {"N": "1200"}, "Source": {"S": "http://www.hawtcelebs.com/wp-content/uploads/2016/05/melissa-rauch-at-the-nice-guys-premiere-in-hollywood-05-10-2016_1.jpg"}}
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "578771a2-7b7c-4a49-ae13-bd755190e647.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "1680"}, "Width": {"N": "1118"}, "Source": {"S": "http://ilarge.lisimg.com/image/4088302/1118full-melissa-rauch.jpg"}}

// Johnny Galecki
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "f1d40dd9-aa68-4aac-b0bf-a9d52d995849.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "1000"}, "Width": {"N": "700"}, "Source": {"S": "http://media.hollywood.com/images/700x1000/5939069.jpg"}}
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "b13bd24d-a2bb-4bf7-9371-5898d5de4467.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "408"}, "Width": {"N": "736"}, "Source": {"S": "http://media.urbantabloid.com/wp-content/uploads/2016/03/Johnny-Galecki1.jpg"}}

// Big Bang Theory cast
aws dynamodb put-item --table-name CelebrityImageFiles --item '{"FileId": {"S": "6b500272-5cea-4ee1-bd8b-7e4161272530.jpg"}, "Extension": {"S": "JPG"}, "Height": {"N": "1080"}, "Width": {"N": "1920"}, "Source": {"S": "http://www.goliath.com/wp-content/uploads/2016/04/Big-Bang-Theory.jpg"}}
