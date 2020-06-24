
bufbomb:     file format elf64-x86-64


Disassembly of section .init:

00000000004004e8 <_init>:
  4004e8:	48 83 ec 08          	sub    $0x8,%rsp
  4004ec:	e8 bb 00 00 00       	callq  4005ac <call_gmon_start>
  4004f1:	48 83 c4 08          	add    $0x8,%rsp
  4004f5:	c3                   	retq   

Disassembly of section .plt:

0000000000400500 <puts@plt-0x10>:
  400500:	ff 35 ea 0c 20 00    	pushq  0x200cea(%rip)        # 6011f0 <_GLOBAL_OFFSET_TABLE_+0x8>
  400506:	ff 25 ec 0c 20 00    	jmpq   *0x200cec(%rip)        # 6011f8 <_GLOBAL_OFFSET_TABLE_+0x10>
  40050c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400510 <puts@plt>:
  400510:	ff 25 ea 0c 20 00    	jmpq   *0x200cea(%rip)        # 601200 <_GLOBAL_OFFSET_TABLE_+0x18>
  400516:	68 00 00 00 00       	pushq  $0x0
  40051b:	e9 e0 ff ff ff       	jmpq   400500 <_init+0x18>

0000000000400520 <printf@plt>:
  400520:	ff 25 e2 0c 20 00    	jmpq   *0x200ce2(%rip)        # 601208 <_GLOBAL_OFFSET_TABLE_+0x20>
  400526:	68 01 00 00 00       	pushq  $0x1
  40052b:	e9 d0 ff ff ff       	jmpq   400500 <_init+0x18>

0000000000400530 <__libc_start_main@plt>:
  400530:	ff 25 da 0c 20 00    	jmpq   *0x200cda(%rip)        # 601210 <_GLOBAL_OFFSET_TABLE_+0x28>
  400536:	68 02 00 00 00       	pushq  $0x2
  40053b:	e9 c0 ff ff ff       	jmpq   400500 <_init+0x18>

0000000000400540 <strcmp@plt>:
  400540:	ff 25 d2 0c 20 00    	jmpq   *0x200cd2(%rip)        # 601218 <_GLOBAL_OFFSET_TABLE_+0x30>
  400546:	68 03 00 00 00       	pushq  $0x3
  40054b:	e9 b0 ff ff ff       	jmpq   400500 <_init+0x18>

0000000000400550 <signal@plt>:
  400550:	ff 25 ca 0c 20 00    	jmpq   *0x200cca(%rip)        # 601220 <_GLOBAL_OFFSET_TABLE_+0x38>
  400556:	68 04 00 00 00       	pushq  $0x4
  40055b:	e9 a0 ff ff ff       	jmpq   400500 <_init+0x18>

0000000000400560 <_IO_getc@plt>:
  400560:	ff 25 c2 0c 20 00    	jmpq   *0x200cc2(%rip)        # 601228 <_GLOBAL_OFFSET_TABLE_+0x40>
  400566:	68 05 00 00 00       	pushq  $0x5
  40056b:	e9 90 ff ff ff       	jmpq   400500 <_init+0x18>

0000000000400570 <exit@plt>:
  400570:	ff 25 ba 0c 20 00    	jmpq   *0x200cba(%rip)        # 601230 <_GLOBAL_OFFSET_TABLE_+0x48>
  400576:	68 06 00 00 00       	pushq  $0x6
  40057b:	e9 80 ff ff ff       	jmpq   400500 <_init+0x18>

Disassembly of section .text:

0000000000400580 <_start>:
  400580:	31 ed                	xor    %ebp,%ebp
  400582:	49 89 d1             	mov    %rdx,%r9
  400585:	5e                   	pop    %rsi
  400586:	48 89 e2             	mov    %rsp,%rdx
  400589:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40058d:	50                   	push   %rax
  40058e:	54                   	push   %rsp
  40058f:	49 c7 c0 c0 08 40 00 	mov    $0x4008c0,%r8
  400596:	48 c7 c1 d0 08 40 00 	mov    $0x4008d0,%rcx
  40059d:	48 c7 c7 1f 08 40 00 	mov    $0x40081f,%rdi
  4005a4:	e8 87 ff ff ff       	callq  400530 <__libc_start_main@plt>
  4005a9:	f4                   	hlt    
  4005aa:	90                   	nop
  4005ab:	90                   	nop

00000000004005ac <call_gmon_start>:
  4005ac:	48 83 ec 08          	sub    $0x8,%rsp
  4005b0:	48 8b 05 29 0c 20 00 	mov    0x200c29(%rip),%rax        # 6011e0 <_DYNAMIC+0x1d0>
  4005b7:	48 85 c0             	test   %rax,%rax
  4005ba:	74 02                	je     4005be <call_gmon_start+0x12>
  4005bc:	ff d0                	callq  *%rax
  4005be:	48 83 c4 08          	add    $0x8,%rsp
  4005c2:	c3                   	retq   
  4005c3:	90                   	nop
  4005c4:	90                   	nop
  4005c5:	90                   	nop
  4005c6:	90                   	nop
  4005c7:	90                   	nop
  4005c8:	90                   	nop
  4005c9:	90                   	nop
  4005ca:	90                   	nop
  4005cb:	90                   	nop
  4005cc:	90                   	nop
  4005cd:	90                   	nop
  4005ce:	90                   	nop
  4005cf:	90                   	nop

00000000004005d0 <deregister_tm_clones>:
  4005d0:	b8 48 12 60 00       	mov    $0x601248,%eax
  4005d5:	48 3d 48 12 60 00    	cmp    $0x601248,%rax
  4005db:	74 13                	je     4005f0 <deregister_tm_clones+0x20>
  4005dd:	b8 00 00 00 00       	mov    $0x0,%eax
  4005e2:	48 85 c0             	test   %rax,%rax
  4005e5:	74 09                	je     4005f0 <deregister_tm_clones+0x20>
  4005e7:	bf 48 12 60 00       	mov    $0x601248,%edi
  4005ec:	ff e0                	jmpq   *%rax
  4005ee:	66 90                	xchg   %ax,%ax
  4005f0:	c3                   	retq   
  4005f1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  4005f8:	0f 1f 84 00 00 00 00 
  4005ff:	00 

0000000000400600 <register_tm_clones>:
  400600:	be 48 12 60 00       	mov    $0x601248,%esi
  400605:	48 81 ee 48 12 60 00 	sub    $0x601248,%rsi
  40060c:	48 89 f0             	mov    %rsi,%rax
  40060f:	48 c1 ee 3f          	shr    $0x3f,%rsi
  400613:	48 c1 f8 03          	sar    $0x3,%rax
  400617:	48 01 c6             	add    %rax,%rsi
  40061a:	48 d1 fe             	sar    %rsi
  40061d:	74 11                	je     400630 <register_tm_clones+0x30>
  40061f:	b8 00 00 00 00       	mov    $0x0,%eax
  400624:	48 85 c0             	test   %rax,%rax
  400627:	74 07                	je     400630 <register_tm_clones+0x30>
  400629:	bf 48 12 60 00       	mov    $0x601248,%edi
  40062e:	ff e0                	jmpq   *%rax
  400630:	c3                   	retq   
  400631:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  400638:	0f 1f 84 00 00 00 00 
  40063f:	00 

0000000000400640 <__do_global_dtors_aux>:
  400640:	80 3d 09 0c 20 00 00 	cmpb   $0x0,0x200c09(%rip)        # 601250 <completed.0>
  400647:	75 17                	jne    400660 <__do_global_dtors_aux+0x20>
  400649:	55                   	push   %rbp
  40064a:	48 89 e5             	mov    %rsp,%rbp
  40064d:	e8 7e ff ff ff       	callq  4005d0 <deregister_tm_clones>
  400652:	c6 05 f7 0b 20 00 01 	movb   $0x1,0x200bf7(%rip)        # 601250 <completed.0>
  400659:	5d                   	pop    %rbp
  40065a:	c3                   	retq   
  40065b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400660:	c3                   	retq   
  400661:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  400668:	0f 1f 84 00 00 00 00 
  40066f:	00 

0000000000400670 <frame_dummy>:
  400670:	eb 8e                	jmp    400600 <register_tm_clones>
  400672:	90                   	nop
  400673:	90                   	nop

0000000000400674 <valid>:
  400674:	55                   	push   %rbp
  400675:	48 89 e5             	mov    %rsp,%rbp
  400678:	48 83 ec 10          	sub    $0x10,%rsp
  40067c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  400680:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400684:	be 70 09 40 00       	mov    $0x400970,%esi
  400689:	48 89 c7             	mov    %rax,%rdi
  40068c:	e8 af fe ff ff       	callq  400540 <strcmp@plt>
  400691:	85 c0                	test   %eax,%eax
  400693:	0f 94 c0             	sete   %al
  400696:	0f b6 c0             	movzbl %al,%eax
  400699:	c9                   	leaveq 
  40069a:	c3                   	retq   

000000000040069b <danger>:
  40069b:	55                   	push   %rbp
  40069c:	48 89 e5             	mov    %rsp,%rbp
  40069f:	bf 7a 09 40 00       	mov    $0x40097a,%edi
  4006a4:	e8 67 fe ff ff       	callq  400510 <puts@plt>
  4006a9:	bf 98 09 40 00       	mov    $0x400998,%edi
  4006ae:	e8 5d fe ff ff       	callq  400510 <puts@plt>
  4006b3:	90                   	nop
  4006b4:	5d                   	pop    %rbp
  4006b5:	c3                   	retq   

00000000004006b6 <protect>:
  4006b6:	55                   	push   %rbp
  4006b7:	48 89 e5             	mov    %rsp,%rbp
  4006ba:	48 83 ec 10          	sub    $0x10,%rsp
  4006be:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  4006c2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  4006c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4006ca:	48 89 c7             	mov    %rax,%rdi
  4006cd:	e8 a2 ff ff ff       	callq  400674 <valid>
  4006d2:	85 c0                	test   %eax,%eax
  4006d4:	74 11                	je     4006e7 <protect+0x31>
  4006d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4006da:	48 89 c7             	mov    %rax,%rdi
  4006dd:	b8 00 00 00 00       	mov    $0x0,%eax
  4006e2:	e8 b4 ff ff ff       	callq  40069b <danger>
  4006e7:	90                   	nop
  4006e8:	c9                   	leaveq 
  4006e9:	c3                   	retq   

00000000004006ea <smoke>:
  4006ea:	55                   	push   %rbp
  4006eb:	48 89 e5             	mov    %rsp,%rbp
  4006ee:	bf c1 09 40 00       	mov    $0x4009c1,%edi
  4006f3:	e8 18 fe ff ff       	callq  400510 <puts@plt>
  4006f8:	bf 00 00 00 00       	mov    $0x0,%edi
  4006fd:	e8 6e fe ff ff       	callq  400570 <exit@plt>

0000000000400702 <fizz>:
  400702:	55                   	push   %rbp
  400703:	48 89 e5             	mov    %rsp,%rbp
  400706:	48 83 ec 10          	sub    $0x10,%rsp
  40070a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40070d:	81 7d fc 04 03 02 01 	cmpl   $0x1020304,-0x4(%rbp)
  400714:	75 16                	jne    40072c <fizz+0x2a>
  400716:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400719:	89 c6                	mov    %eax,%esi
  40071b:	bf dc 09 40 00       	mov    $0x4009dc,%edi
  400720:	b8 00 00 00 00       	mov    $0x0,%eax
  400725:	e8 f6 fd ff ff       	callq  400520 <printf@plt>
  40072a:	eb 14                	jmp    400740 <fizz+0x3e>
  40072c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  40072f:	89 c6                	mov    %eax,%esi
  400731:	bf 00 0a 40 00       	mov    $0x400a00,%edi
  400736:	b8 00 00 00 00       	mov    $0x0,%eax
  40073b:	e8 e0 fd ff ff       	callq  400520 <printf@plt>
  400740:	bf 00 00 00 00       	mov    $0x0,%edi
  400745:	e8 26 fe ff ff       	callq  400570 <exit@plt>

000000000040074a <Gets>:
  40074a:	55                   	push   %rbp
  40074b:	48 89 e5             	mov    %rsp,%rbp
  40074e:	48 83 ec 20          	sub    $0x20,%rsp
  400752:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  400756:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40075a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  40075e:	eb 11                	jmp    400771 <Gets+0x27>
  400760:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400764:	48 8d 50 01          	lea    0x1(%rax),%rdx
  400768:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  40076c:	8b 55 f4             	mov    -0xc(%rbp),%edx
  40076f:	88 10                	mov    %dl,(%rax)
  400771:	48 8b 05 e0 0a 20 00 	mov    0x200ae0(%rip),%rax        # 601258 <infile>
  400778:	48 89 c7             	mov    %rax,%rdi
  40077b:	e8 e0 fd ff ff       	callq  400560 <_IO_getc@plt>
  400780:	89 45 f4             	mov    %eax,-0xc(%rbp)
  400783:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%rbp)
  400787:	74 06                	je     40078f <Gets+0x45>
  400789:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  40078d:	75 d1                	jne    400760 <Gets+0x16>
  40078f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400793:	48 8d 50 01          	lea    0x1(%rax),%rdx
  400797:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  40079b:	c6 00 00             	movb   $0x0,(%rax)
  40079e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4007a2:	c9                   	leaveq 
  4007a3:	c3                   	retq   

00000000004007a4 <bushandler>:
  4007a4:	55                   	push   %rbp
  4007a5:	48 89 e5             	mov    %rsp,%rbp
  4007a8:	48 83 ec 10          	sub    $0x10,%rsp
  4007ac:	89 7d fc             	mov    %edi,-0x4(%rbp)
  4007af:	bf 20 0a 40 00       	mov    $0x400a20,%edi
  4007b4:	e8 57 fd ff ff       	callq  400510 <puts@plt>
  4007b9:	bf 40 0a 40 00       	mov    $0x400a40,%edi
  4007be:	e8 4d fd ff ff       	callq  400510 <puts@plt>
  4007c3:	bf 00 00 00 00       	mov    $0x0,%edi
  4007c8:	e8 a3 fd ff ff       	callq  400570 <exit@plt>

00000000004007cd <seghandler>:
  4007cd:	55                   	push   %rbp
  4007ce:	48 89 e5             	mov    %rsp,%rbp
  4007d1:	48 83 ec 10          	sub    $0x10,%rsp
  4007d5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  4007d8:	bf 58 0a 40 00       	mov    $0x400a58,%edi
  4007dd:	e8 2e fd ff ff       	callq  400510 <puts@plt>
  4007e2:	bf 40 0a 40 00       	mov    $0x400a40,%edi
  4007e7:	e8 24 fd ff ff       	callq  400510 <puts@plt>
  4007ec:	bf 00 00 00 00       	mov    $0x0,%edi
  4007f1:	e8 7a fd ff ff       	callq  400570 <exit@plt>

00000000004007f6 <illegalhandler>:
  4007f6:	55                   	push   %rbp
  4007f7:	48 89 e5             	mov    %rsp,%rbp
  4007fa:	48 83 ec 10          	sub    $0x10,%rsp
  4007fe:	89 7d fc             	mov    %edi,-0x4(%rbp)
  400801:	bf 80 0a 40 00       	mov    $0x400a80,%edi
  400806:	e8 05 fd ff ff       	callq  400510 <puts@plt>
  40080b:	bf 40 0a 40 00       	mov    $0x400a40,%edi
  400810:	e8 fb fc ff ff       	callq  400510 <puts@plt>
  400815:	bf 00 00 00 00       	mov    $0x0,%edi
  40081a:	e8 51 fd ff ff       	callq  400570 <exit@plt>

000000000040081f <main>:
  40081f:	55                   	push   %rbp
  400820:	48 89 e5             	mov    %rsp,%rbp
  400823:	48 83 ec 10          	sub    $0x10,%rsp
  400827:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40082a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  40082e:	be cd 07 40 00       	mov    $0x4007cd,%esi
  400833:	bf 0b 00 00 00       	mov    $0xb,%edi
  400838:	e8 13 fd ff ff       	callq  400550 <signal@plt>
  40083d:	be a4 07 40 00       	mov    $0x4007a4,%esi
  400842:	bf 07 00 00 00       	mov    $0x7,%edi
  400847:	e8 04 fd ff ff       	callq  400550 <signal@plt>
  40084c:	be f6 07 40 00       	mov    $0x4007f6,%esi
  400851:	bf 04 00 00 00       	mov    $0x4,%edi
  400856:	e8 f5 fc ff ff       	callq  400550 <signal@plt>
  40085b:	48 8b 05 e6 09 20 00 	mov    0x2009e6(%rip),%rax        # 601248 <__bss_start>
  400862:	48 89 05 ef 09 20 00 	mov    %rax,0x2009ef(%rip)        # 601258 <infile>
  400869:	b8 00 00 00 00       	mov    $0x0,%eax
  40086e:	e8 11 00 00 00       	callq  400884 <getbuf>
  400873:	bf b0 0a 40 00       	mov    $0x400ab0,%edi
  400878:	e8 93 fc ff ff       	callq  400510 <puts@plt>
  40087d:	b8 00 00 00 00       	mov    $0x0,%eax
  400882:	c9                   	leaveq 
  400883:	c3                   	retq   

0000000000400884 <getbuf>:
  400884:	55                   	push   %rbp
  400885:	48 89 e5             	mov    %rsp,%rbp
  400888:	48 83 ec 20          	sub    $0x20,%rsp
  40088c:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400890:	48 89 c6             	mov    %rax,%rsi
  400893:	bf d4 0a 40 00       	mov    $0x400ad4,%edi
  400898:	b8 00 00 00 00       	mov    $0x0,%eax
  40089d:	e8 7e fc ff ff       	callq  400520 <printf@plt>
  4008a2:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  4008a6:	48 89 c7             	mov    %rax,%rdi
  4008a9:	e8 9c fe ff ff       	callq  40074a <Gets>
  4008ae:	b8 01 00 00 00       	mov    $0x1,%eax
  4008b3:	c9                   	leaveq 
  4008b4:	c3                   	retq   
  4008b5:	90                   	nop
  4008b6:	90                   	nop
  4008b7:	90                   	nop
  4008b8:	90                   	nop
  4008b9:	90                   	nop
  4008ba:	90                   	nop
  4008bb:	90                   	nop
  4008bc:	90                   	nop
  4008bd:	90                   	nop
  4008be:	90                   	nop
  4008bf:	90                   	nop

00000000004008c0 <__libc_csu_fini>:
  4008c0:	f3 c3                	repz retq 
  4008c2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  4008c9:	1f 84 00 00 00 00 00 

00000000004008d0 <__libc_csu_init>:
  4008d0:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  4008d5:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  4008da:	48 8d 2d 27 07 20 00 	lea    0x200727(%rip),%rbp        # 601008 <__init_array_end>
  4008e1:	4c 8d 25 18 07 20 00 	lea    0x200718(%rip),%r12        # 601000 <__frame_dummy_init_array_entry>
  4008e8:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  4008ed:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  4008f2:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  4008f7:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  4008fc:	48 83 ec 38          	sub    $0x38,%rsp
  400900:	4c 29 e5             	sub    %r12,%rbp
  400903:	41 89 fd             	mov    %edi,%r13d
  400906:	49 89 f6             	mov    %rsi,%r14
  400909:	48 c1 fd 03          	sar    $0x3,%rbp
  40090d:	49 89 d7             	mov    %rdx,%r15
  400910:	e8 d3 fb ff ff       	callq  4004e8 <_init>
  400915:	48 85 ed             	test   %rbp,%rbp
  400918:	74 1c                	je     400936 <__libc_csu_init+0x66>
  40091a:	31 db                	xor    %ebx,%ebx
  40091c:	0f 1f 40 00          	nopl   0x0(%rax)
  400920:	4c 89 fa             	mov    %r15,%rdx
  400923:	4c 89 f6             	mov    %r14,%rsi
  400926:	44 89 ef             	mov    %r13d,%edi
  400929:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40092d:	48 83 c3 01          	add    $0x1,%rbx
  400931:	48 39 eb             	cmp    %rbp,%rbx
  400934:	72 ea                	jb     400920 <__libc_csu_init+0x50>
  400936:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  40093b:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  400940:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  400945:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  40094a:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  40094f:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  400954:	48 83 c4 38          	add    $0x38,%rsp
  400958:	c3                   	retq   
  400959:	90                   	nop
  40095a:	90                   	nop
  40095b:	90                   	nop

Disassembly of section .fini:

000000000040095c <_fini>:
  40095c:	48 83 ec 08          	sub    $0x8,%rsp
  400960:	48 83 c4 08          	add    $0x8,%rsp
  400964:	c3                   	retq   
