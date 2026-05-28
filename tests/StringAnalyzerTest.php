<?php

namespace Talhag3\StringAnalyzer\Tests;

use PHPUnit\Framework\TestCase;
use Talhag3\StringAnalyzer\StringAnalyzer;

class StringAnalyzerTest extends TestCase
{
    private StringAnalyzer $analyzer;

    protected function setUp(): void
    {
        $this->analyzer = new StringAnalyzer();
    }

    public function testAnalyzeNormalString(): void
    {
        $result = $this->analyzer->analyze('Hello World!');
        $this->assertEquals(12, $result['characters']);
        $this->assertEquals(2, $result['words']);
        $this->assertEquals(1, $result['spaces']);
        $this->assertEquals(1, $result['special_chars']); // '!'
    }

    public function testAnalyzeEmptyString(): void
    {
        $result = $this->analyzer->analyze('');
        $this->assertEquals(0, $result['characters']);
        $this->assertEquals(0, $result['words']);
        $this->assertEquals(0, $result['spaces']);
        $this->assertEquals(0, $result['special_chars']);
    }

    public function testAnalyzeSpecialCharsOnly(): void
    {
        $result = $this->analyzer->analyze('@#$%');
        $this->assertEquals(4, $result['characters']);
        $this->assertEquals(0, $result['words']);
        $this->assertEquals(0, $result['spaces']);
        $this->assertEquals(4, $result['special_chars']);
    }
}