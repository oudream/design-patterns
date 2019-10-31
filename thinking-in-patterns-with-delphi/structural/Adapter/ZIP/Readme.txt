//
// Copyright 2002, Neal C. Stublen
// Commercial use requires permission.
//
// Contact: nstublen_public@yahoo.com
//

ZipFiles.dpr is a Delphi 6 project (using Update Pack 1).

Included files:
- Form_ZipFiles.dfm
- Form_ZipFiles.pas
- Info-Zip License.txt
- MyThread.pas
- Zip32.dll
- Zip32.pas
- ZipFiles.cfg
- ZipFiles.dof
- ZipFiles.dpr
- ZipFiles.exe
- ZipFiles.res
- ZipFilesThread.pas

Zip Files creates a thread that compresses a set of files into a
standard .zip file.  The thread provides event properties so the
main thread can be updated concerning the status of the zip operation.

Multithreading features:
- Protection of shared objects using critical sections.
- Activation of thread processing using Win32 events.
- Notification of thread progress using TThread.Synchronize() calls.
- Encapsulation of TThread synchronization within the TZipFilesThread
  class.
- Mapping of standard DLL callbacks to a particular thread.
- Thread termination using a Win2 event.

Much could still be done to improve the zip thread, including:
- better handling and notification of errors
- external control of zipping options

Thanks to the guys at Info-Zip for providing Zip32.dll to the public
(see Info-Zip License.txt).  The complete Info-Zip package including
source code and Unzip32.dll is available at http://www.info-zip.com.
 
Thanks to Theo Bebekis and Marcus Wirth for the Delphi interface to
Zip32.dll (see Zip32.pas).  The complete package including Unzip32.pas
can be found at http://www.torry.net under the title "Zip32 And
UnZip32 v.0.02".
