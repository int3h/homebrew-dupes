require 'formula'

class Groff < Formula
  homepage 'http://www.gnu.org/software/groff/'
  url 'http://ftpmirror.gnu.org/groff/groff-1.22.2.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/groff/groff-1.22.2.tar.gz'
  sha1 '37223941e25bb504bf54631daaabb01b147dc1d3'

  depends_on 'ghostscript'
  depends_on 'netpbm'
  depends_on 'psutils'

  def patches
    # Fix a bug where ./configure would hang trying to execute a shell command with a '|' in it
    DATA
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--without-x"
    system "make" # Separate steps required
    system "make install"
  end
end


__END__
diff --git a/configure b/configure
index 63e9e5d..6f97736 100755
--- a/configure
+++ b/configure
@@ -10440,18 +10440,8 @@ $as_echo "$as_me: WARNING: missing program$plural:
 
 
 
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether pnmtops can handle the -nosetpage option" >&5
-$as_echo_n "checking whether pnmtops can handle the -nosetpage option... " >&6; }
-   if echo P2 2 2 255 0 1 2 0 | pnmtops -nosetpage > /dev/null 2>&1 ; then
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
-     pnmtops_nosetpage="pnmtops -nosetpage"
-   else
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-     pnmtops_nosetpage="pnmtops"
-   fi
 
+pnmtops_nosetpage="pnmtops -nosetpage"
 
     { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether we are using the GNU C Library >= 2.1 or uClibc" >&5
 $as_echo_n "checking whether we are using the GNU C Library >= 2.1 or uClibc... " >&6; }

