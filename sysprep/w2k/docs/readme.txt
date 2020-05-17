**********************************************************************
                        Microsoft Windows 2000 
                      Guide to Unattended Setup 
                            Release Notes                           
                            December 1999
**********************************************************************

Information in this document, including URL and other Internet Web
site references, is subject to change without notice and is provided
for informational purposes only. The entire risk of the use or results
of the use of this document remains with the user, and Microsoft
Corporation makes no warranties, either express or implied. The
example companies, organizations, products, people, and events
depicted herein are fictitious. No association with any real company,
organization, product, person, or event is intended or should be
inferred. Complying with all applicable copyright laws is the
responsibility of the user. Without limiting the rights under
copyright, no part of this document may be reproduced, stored in or
introduced into a retrieval system, or transmitted in any form or by
any means (electronic, mechanical, photocopying, recording, or
otherwise), or for any purpose, without the express written permission
of Microsoft Corporation.

Microsoft may have patents, patent applications, trademarks,
copyrights, or other intellectual property rights covering subject
matter in this document. Except as expressly provided in any written
license agreement from Microsoft, the furnishing of this document does
not give you any license to these patents, trademarks, copyrights, or
other intellectual property.

(c) 1999 Microsoft Corporation. All rights reserved.

Microsoft, MS-DOS, Windows, and Windows NT are either registered
trademarks or trademarks of Microsoft Corporation in the United States
and/or other countries/regions.

The names of actual companies and products mentioned herein may be the
trademarks of their respective owners.

======================================================================
How to Use This Document
======================================================================

To view this document in Notepad, maximize the Notepad window. For
best viewing, click Edit, and then click Word Wrap.

To print this document, open it in Notepad or another word processor,
click the File menu, and then click Print. For best printing results,
set font size to 9 point.

======================================================================
Contents
======================================================================

1.0 INTRODUCTION 
2.0 DISABLING PnP IRQ SCAN 
3.0 ADDITIONS 
    3.1 Chapter 3, The Sysprep Utility and Sysprep.inf File Parameters

----------------------------------------------------------------------
1.0 Introduction
----------------------------------------------------------------------

Welcome to the "Microsoft Windows 2000 Guide to Unattended Setup
Release Notes." This document provides complementary or late-breaking
information about unattended installations of the 
Microsoft Windows 2000 family of products.

----------------------------------------------------------------------
2.0 Disabling PnP IRQ Scan
----------------------------------------------------------------------

After installing and restarting Windows 2000 on some computers that
have the CardBus controller indicated next to them, a "Code 10"
message may appear. This occurs if the Peripheral Component
Interconnect (PCI) cards are given incorrect interrupt request (IRQ)
settings during Plug and Play (PnP) detection. If the impacted PCI
cards are manually configured, the message does not appear unless the
PCI card is removed and reinserted. At that time, the message appears
again.

The following computers receive "Code 10" messages with certain PCI
cards if the Windows 2000 PnP IRQ Scan is not disabled:

Manufacturer    Model                CardBus Controller
======================================================================
Compaq          Egypt                Texas Instruments PCI-1220 
Micron          XTE Transport XKE    Texas Instruments PCI-1131 
NEC             6200                 Texas Instruments PCI-1131 
Toshiba         460CDT               Toshiba ToPic95

To resolve the issue, in the unattended answer file, Unattend.txt, 
add the following section and key:

[SetupData]

OSLoadOptionsVar = /NoIrqScan

This adds /NoIrqScan to the Boot.ini parameters for Windows 2000 so
that the parameters are incorporated into the GUI-mode Setup. This
parameter remains after Setup so that any PnP detection handles the
PCI card configuration properly.

----------------------------------------------------------------------
3.0 Additions
----------------------------------------------------------------------

This section describes the addition of new keys and parameters, and
new text to existing keys and parameters, to the "Microsoft Windows
2000 Guide to Unattended Setup."

3.1 Chapter 3, The Sysprep Utility and Sysprep.inf File Parameters
----------------------------------------------------------------------
The following information is an addition to the list of Sysprep.inf
parameters:

[SysprepMassStorage] 

Valid for Sysprep (version 1.1) only. This
section allows you to prepopulate mass storage controller PnP ID
information when you create the master computer image. You can then
reduce the number of images maintained in your environment by
generating one master image for multiple destination computers that
may use different mass storage controllers.

Important: The destination computers must use compatible HALs.
   
For example, for mass storage controllers that are
provided on the Windows 2000 CD, create a Sysprep.inf with the
following section: 

[SysprepMassStorage]

<hardware id> = <path to device inf>

where:    

   * <hardware id>  is the PnP ID for the device as
     specified in the device's .inf file.    
   * <path to device inf>  is the
      path to INF that contains the PnP ID of the controller to be
      installed.

For example, to support the different IDE
controllers (PCI and Intel) shipped with Windows 2000, the section
may look like the following: 

[SysprepMassStorage]
PCI\VEN_8086&DEV_1222 = "%windir%\inf\mshdc.inf"
PCI\VEN_8086&DEV_1230 = "%windir%\inf\mshdc.inf"
PCI\VEN_8086&DEV_7010 = "%windir%\inf\mshdc.inf"
PCI\VEN_8086&DEV_7111 = "%windir%\inf\mshdc.inf"
PCI\VEN_8086&DEV_2411 = "%windir%\inf\mshdc.inf"
PCI\VEN_8086&DEV_2421 = "%windir%\inf\mshdc.inf"
PCI\VEN_8086&DEV_7199 = "%windir%\inf\mshdc.inf"

For information about identifying mass storage controllers that are
not provided on the Windows 2000 CD, see "Reducing the Number of
Master Images" under "Tips for Implementing Sysprep."

 

