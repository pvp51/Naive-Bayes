$mean = 0;
$data = shift;
$dir=$data."_std";
$dir=$data;
for(my $i=0; $i<10; $i++){
  system("python3 NaiveBayes.py $dir/$data.data $dir/$data.trainlabels.$i > nb_out.$data");
  $err[$i] = `perl error.pl $dir/$data.labels nb_out.$data`;
  chomp $err[$i];
  print "$err[$i]\n";
  $mean += $err[$i];
 
}
$mean /= 10;
$sd = 0;
for(my $i=0; $i<10; $i++){
  $sd += ($err[$i]-$mean)**2;
}
$sd /= 10;
$sd = sqrt($sd);
print "Naive Bayes error = $mean ($sd)\n";